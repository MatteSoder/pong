package server

import (
	"context"
	"errors"
	"log"
	"sync"
	"time"

	"github.com/MatteSoder/pong/pb"
	"github.com/MatteSoder/pong/pkg/entities"
	"github.com/MatteSoder/pong/pkg/game"
	"github.com/google/uuid"
	"google.golang.org/grpc/metadata"
)

const (
	// Client timeout in minutes
	clientTimeout = 15
	// Maximum number of clients allowed
	maxClients = 2
)

// GameServer is used to stream game information with clients.
type GameServer struct {
	pb.UnimplementedGameServiceServer
	pong    game.Pong
	clients map[uuid.UUID]*client
	mu      sync.RWMutex
}

// NewGameServer constructs a new game server struct.
func NewGameServer(pong game.Pong) *GameServer {
	server := &GameServer{
		pong:    pong,
		clients: make(map[uuid.UUID]*client),
	}
	// Start listening for changes
	server.changeListener()
	// Start listening for client timeout
	server.timeoutListener()
	return server
}

// Stream is the main loop for dealing with individual players.
func (s *GameServer) Stream(srv pb.GameService_StreamServer) error {
	ctx := srv.Context()
	client, err := s.extractClientFromContext(ctx)
	if err != nil {
		return err
	}
	if client.streamServer != nil {
		return errors.New("stream already active")
	}
	client.streamServer = srv

	// Wait for stream requests.
	go func() {
		for {
			req, err := srv.Recv()
			if err != nil {
				client.done <- errors.New("failed to receive request")
				return
			}
			// Update client's last interaction
			client.activeTime = time.Now()

			// Get the action
			switch req.GetAction().(type) {
			case *pb.StreamRequest_Move:
				s.handleMoveRequest(req, client)
			}
		}
	}()

	// Wait for stream to be done.
	var doneError error
	select {
	case <-ctx.Done():
		doneError = ctx.Err()
	case doneError = <-client.done:
	}
	log.Printf(`stream done with error "%v"`, doneError)

	log.Printf("%s - removing client", client.id)
	// Remove client
	s.removeClient(client.id)

	return doneError
}

func (s *GameServer) Connect(ctx context.Context, req *pb.ConnectRequest) (*pb.ConnectResponse, error) {
	if len(s.clients) >= maxClients {
		return nil, errors.New("server is full")
	}

	playerID, err := uuid.Parse(req.Id)
	if err != nil {
		return nil, err
	}

	// Check if player already exists.
	if s.pong.GetPlayer(playerID) != nil {
		return nil, errors.New("duplicate player ID provided")
	}

	// Determine the position of the player based on the number of players.
	startPos := entities.Coordinate{X: .9, Y: 0}
	if len(s.clients) == 1 {
		startPos = entities.Coordinate{X: -.9, Y: 0}
	}

	player := &entities.Player{
		Entity: entities.NewBaseEntity(playerID, startPos),
	}
	// Add player to game
	s.pong.AddEntity(player)

	// Inform all other clients of the new player.
	resp := pb.StreamResponse{
		Action: &pb.StreamResponse_AddEntity{
			AddEntity: &pb.AddEntity{Entity: parseEntity(player)},
		},
	}
	s.broadcast(&resp)

	// Add the new client.
	s.mu.Lock()
	// Generate a new client identifier
	clientID := uuid.New()
	s.clients[clientID] = &client{
		id:         clientID,
		playerID:   playerID,
		done:       make(chan error),
		activeTime: time.Now(),
	}
	s.mu.Unlock()

	log.Printf("Connected with client: %v", s.clients[clientID])

	// Get all the entities from the game and return
	entities := make([]*pb.Entity, 0)
	for _, e := range s.pong.GetEntities() {
		// Parse the domain entity
		entity := parseEntity(e)
		// Add entity to slice
		if entity != nil {
			entities = append(entities, entity)
		}
	}
	// Return with the new entities
	return &pb.ConnectResponse{
		ClientId: clientID.String(),
		Entities: entities,
	}, nil
}

// extractClientFromContext retrieves the client from the context with the matching client identifier.
func (s *GameServer) extractClientFromContext(ctx context.Context) (*client, error) {
	// Extract the headers from the incoming  message
	headers, _ := metadata.FromIncomingContext(ctx)
	// Get the client ideitifier
	clientIdRaw := headers["client_id"]
	if len(clientIdRaw) == 0 {
		return nil, errors.New("no cliennt id provided")
	}
	clientId, err := uuid.Parse(clientIdRaw[0])
	if err != nil {
		return nil, errors.New("cannot parse client id")
	}
	s.mu.RLock()
	defer s.mu.RUnlock()
	client, ok := s.clients[clientId]
	if !ok {
		return nil, errors.New("client id not recognized")
	}
	// Return with the client
	return client, nil
}

func (s *GameServer) timeoutListener() {
	timeoutTicker := time.NewTicker(1 * time.Minute)
	go func() {
		for {
			for _, client := range s.clients {
				// Check time since the last interaction from the client.
				if time.Since(client.activeTime).Minutes() > clientTimeout {
					// Inform the client that of timeout
					client.done <- errors.New("you have been timed out")
					return
				}
			}
			<-timeoutTicker.C
		}
	}()
}

func (s *GameServer) changeListener() {
	go func() {
		for {
			change := <-s.pong.ChangeListener()
			// Update game based on the change
			switch t := change.(type) {
			case game.MoveChange:
				s.handleMoveChange(t)
			}
		}
	}()
}

func (s *GameServer) handleMoveChange(change game.MoveChange) {
	resp := pb.StreamResponse{
		Action: &pb.StreamResponse_UpdateEntity{
			UpdateEntity: &pb.UpdateEntity{
				Entity: parseEntity(change.Entity),
			},
		},
	}
	s.broadcast(&resp)
}

func (s *GameServer) handleMoveRequest(req *pb.StreamRequest, client *client) {
	move := req.GetMove()
	s.pong.ActionChannel() <- game.MoveAction{
		ID:        client.playerID,
		Direction: parseDirection(move.Direction),
		Created:   time.Now(),
	}
}

// broadcast sends a response to all clients.
func (s *GameServer) broadcast(resp *pb.StreamResponse) {
	s.mu.Lock()
	for id, client := range s.clients {
		if client.streamServer == nil {
			continue
		}
		if err := client.streamServer.Send(resp); err != nil {
			log.Printf("%s - broadcast error %v", id, err)
			client.done <- errors.New("failed to broadcast message")
			continue
		}
		log.Printf("%s - broadcasted %+v", resp, id)
	}
	s.mu.Unlock()
}

func (s *GameServer) removeClient(id uuid.UUID) {
	s.mu.Lock()
	delete(s.clients, id)
	s.mu.Unlock()
}

/// parseEntity maps the domain entity into the protobuf entity
func parseEntity(entity entities.Entity) *pb.Entity {
	switch e := entity.(type) {
	case *entities.Player:
		// Parse the domain entity into protobuf
		pbPlayer := pb.Entity_Player{
			Player: parsePlayer(e),
		}
		// Return the entity
		return &pb.Entity{Entity: &pbPlayer}
	case *entities.Ball:
		// Parse the domain entity into protobuf
		pbBall := pb.Entity_Ball{
			Ball: parseBall(e),
		}
		// Return the entity
		return &pb.Entity{Entity: &pbBall}
	}
	log.Printf("cannot get proto entity for %T -> %+v", entity, entity)
	return nil
}

/// parsePlayer maps the domain Player entity into the protobuf Player model.
func parsePlayer(entity *entities.Player) *pb.Player {
	return &pb.Player{
		Id: entity.Id().String(),
		Position: &pb.Coordinate{
			X: float64(entity.Coordinate().X),
			Y: float64(entity.Coordinate().Y),
		},
	}
}

/// parseBall maps the domain Ball entity into the protobuf Ball model.
func parseBall(entity *entities.Ball) *pb.Ball {
	return &pb.Ball{
		Id: entity.Id().String(),
		Position: &pb.Coordinate{
			X: float64(entity.Coordinate().X),
			Y: float64(entity.Coordinate().Y),
		},
	}
}

func parseDirection(pbDir pb.Direction) entities.Direction {
	direction := entities.DirectionNONE
	switch pbDir {
	case pb.Direction_DIRECTION_UP:
		direction = entities.DirectionUP
	case pb.Direction_DIRECTION_DOWN:
		direction = entities.DirectionDOWN
	case pb.Direction_DIRECTION_LEFT:
		direction = entities.DirectionLEFT
	case pb.Direction_DIRECTION_RIGHT:
		direction = entities.DirectionRIGHT
	}
	return direction
}

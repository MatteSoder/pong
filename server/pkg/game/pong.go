package game

import (
	"sync"
	"time"

	"github.com/MatteSoder/pong/pkg/entities"
	"github.com/google/uuid"
)

const (
	collisionCheckFrequency = 10 * time.Millisecond
	ballUpdateFrequency     = 10 * time.Millisecond
)

type Pong interface {
	// Start begins the main game loop, which waits for new actions and updates the game state occordinly.
	Start()
	// Add a player to the game
	AddPlayer(entity entities.Player)
	// Retrieve a specitic player from the game
	GetPlayer(id uuid.UUID) *entities.Player
	GetPlayers() []entities.Player
	// Retrieve a specific ball from the game
	GetBall() *entities.Ball
	// Get all entities in the game
	GetEntities() map[uuid.UUID]entities.Entity

	GetEntity(id uuid.UUID) entities.Entity

	AddEntity(entity entities.Entity)
	// Listens for changes in the game
	ChangeListener() chan Change

	SendChange(change Change)
	// Listen for actions in the game
	ActionChannel() chan Action
}

// Game is the backend engine for the game. It can be used regardless of how
// game data is rendered, or if a game server is being used.
type pong struct {
	entities map[uuid.UUID]entities.Entity

	Mu            sync.RWMutex
	changeChannel chan Change
	actionChannel chan Action
	lastAction    map[string]time.Time
	Score         map[uuid.UUID]int
}

// NewGame constructs a new Game struct.
func NewPong() Pong {
	p := &pong{
		entities:      make(map[uuid.UUID]entities.Entity),
		lastAction:    make(map[string]time.Time),
		actionChannel: make(chan Action, 1),
		changeChannel: make(chan Change, 1),
		Score:         make(map[uuid.UUID]int),
	}
	ballID := uuid.New()
	p.entities[ballID] = entities.NewBall(ballID)

	return p
}

// Start begins the main game loop, which waits for new actions and updates the
// game state occordinly.
func (pong *pong) Start() {
	go pong.checkActions()
	go pong.checkCollisions()
	go pong.updateBallPosition()
}

// checkActions waits for new actions to come in and performs them.
func (pong *pong) checkActions() {
	for {
		action := <-pong.actionChannel
		pong.Mu.Lock()
		action.Perform(pong)
		pong.Mu.Unlock()
	}
}

// checkCollisions checks for entity collisions.
func (p *pong) checkCollisions() {
	for {

		// Check if ball has collided with any of the players

		ball := p.GetBall()
		players := p.GetPlayers()

		p.Mu.Lock()
		if ball != nil {
			x := ball.Coordinate().X
			y := ball.Coordinate().Y
			// Check if ball has collided with any of the borders.
			if x >= 1 {
				ball.SetVerticalDirection(entities.DirectionLEFT)
			} else if x <= -1 {
				ball.SetVerticalDirection(entities.DirectionRIGHT)
			}
			if y >= 1 {
				ball.SetDirection(entities.DirectionUP)
			} else if y <= -1 {
				ball.SetDirection(entities.DirectionDOWN)
			}

			paddleOffset := .1
			for _, p := range players {
				// Check if we've collided with a player
				if x >= p.Coordinate().X && y <= p.Coordinate().Y+paddleOffset && y >= p.Coordinate().Y-paddleOffset {
					// Determine the vertical direction
					if y >= p.Coordinate().Y+.07 {
						ball.SetDirection(entities.DirectionDOWN)
					} else if y <= p.Coordinate().Y-.07 {
						ball.SetDirection(entities.DirectionUP)
					} else {
						ball.SetDirection(entities.DirectionNONE)
					}

					// Determine the horizontal direction
					switch ball.Direction() {
					case entities.DirectionLEFT:
						ball.SetVerticalDirection(entities.DirectionRIGHT)
					case entities.DirectionRIGHT:
						ball.SetVerticalDirection(entities.DirectionLEFT)
					}
				}
			}
		}
		p.Mu.Unlock()
		time.Sleep(collisionCheckFrequency)
	}
}

// updateBallPosition update the balls position according to it's directions.
func (p *pong) updateBallPosition() {
	for {

		ball := p.GetBall()

		p.Mu.Lock()
		// Move the entity
		position := ball.Coordinate()
		// Move the entity.
		switch ball.Direction() {
		case entities.DirectionUP:
			position.Y -= .005
		case entities.DirectionDOWN:
			position.Y += .005
		}

		// Move the entity.
		switch ball.VerticalDirection() {
		case entities.DirectionLEFT:
			position.X -= .01
		case entities.DirectionRIGHT:
			position.X += .01
		}

		/*log.Printf("Horizontal dir: %v", ball.Direction())
		log.Printf("Vertical dir: %v", ball.VerticalDirection())
		log.Printf("Position: %v", position)*/

		// Update entity position
		ball.SetCoordinate(position)

		p.Mu.Unlock()

		// Inform listeners of the change
		p.SendChange(MoveChange{
			Entity:    ball,
			Direction: ball.Direction(),
			Position:  position,
		})

		time.Sleep(ballUpdateFrequency)
	}
}

// Perform executes an action to move the entity
func (action MoveAction) Perform(p Pong) {
	// Get the entity with the matching ID
	entity := p.GetEntity(action.ID)
	if entity == nil {
		return
	}
	// Move the entity
	position := entity.Coordinate()
	// Move the entity.
	switch action.Direction {
	case entities.DirectionUP:
		position.Y -= .03
	case entities.DirectionDOWN:
		position.Y += .03
	case entities.DirectionLEFT:
		position.X -= .01
	case entities.DirectionRIGHT:
		position.X += 0.1
	}
	// Update entity position
	entity.SetCoordinate(position)
	// Inform listeners of the change
	p.SendChange(MoveChange{
		Entity:    entity,
		Direction: action.Direction,
		Position:  position,
	})

}

func (p *pong) ChangeListener() chan Change {
	return p.changeChannel
}

func (p *pong) ActionChannel() chan Action {
	return p.actionChannel
}

// sendChange sends a change to the change channel.
func (p *pong) SendChange(change Change) {
	select {
	case p.changeChannel <- change:
	default:
	}
}

// GetEntity gets an entity from the game.
func (p *pong) GetEntities() map[uuid.UUID]entities.Entity {
	p.Mu.RLock()
	defer p.Mu.RUnlock()
	return p.entities
}

// GetEntity gets an entity from the game.
func (p *pong) GetEntity(id uuid.UUID) entities.Entity {
	return p.entities[id]
}

// AddPlayer adds an entity to the game.
func (p *pong) AddEntity(entity entities.Entity) {
	p.Mu.Lock()
	p.entities[entity.Id()] = entity
	defer p.Mu.Unlock()
}

// AddPlayer adds an entity to the game.
func (p *pong) AddPlayer(entity entities.Player) {
	p.Mu.Lock()
	p.entities[entity.Id()] = entity
	defer p.Mu.Unlock()
}

func (p *pong) GetPlayer(id uuid.UUID) *entities.Player {
	// Lock thread
	p.Mu.RLock()
	// Unlock thread
	defer p.Mu.RUnlock()

	entity := p.entities[id]
	player, ok := entity.(*entities.Player)
	if !ok {
		return nil
	}

	return player
}
func (p *pong) GetBall() *entities.Ball {
	// Lock thread
	p.Mu.RLock()
	// Unlock thread
	defer p.Mu.RUnlock()

	for _, entity := range p.entities {
		switch e := entity.(type) {
		case *entities.Ball:
			return e
		default:
			break
		}
	}
	return nil
}

func (p *pong) GetPlayers() []entities.Player {
	// Lock thread
	p.Mu.RLock()
	// Unlock thread
	defer p.Mu.RUnlock()

	eSlice := make([]entities.Player, 0)
	for _, entity := range p.entities {
		switch e := entity.(type) {
		case *entities.Player:
			eSlice = append(eSlice, *e)
			break
		default:
			break
		}
	}
	return eSlice
}

// Change is sent by the game engine in response to Actions.
type Change interface{}

// MoveChange is sent when the game engine moves an entity.
type MoveChange struct {
	Change
	Entity    entities.Entity
	Direction entities.Direction
	Position  entities.Coordinate
}

// RoundOverChange indicates that a round is over. Information about the new
// round should be retrieved from the game instance.
type RoundOverChange struct {
	Change
}

// RoundStartChange indicates that a round has started.
type RoundStartChange struct {
	Change
}

// Action is sent by the client when attempting to change game state. The
// engine can choose to reject Actions if they are invalid or performed too
// frequently.
type Action interface {
	Perform(pong Pong)
}

// MoveAction is sent when a user presses an arrow key.
type MoveAction struct {
	Direction entities.Direction
	ID        uuid.UUID
	Created   time.Time
}

type MoveBallAction struct {
	HorizontalDirection entities.Direction
	VerticalDirection   entities.Direction
	Created             time.Time
}

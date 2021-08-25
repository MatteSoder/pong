package server

import (
	"time"

	"github.com/MatteSoder/pong/pb"
	"github.com/google/uuid"
)

// client contains information about connected clients.
type client struct {
	// client ideitifier
	id uuid.UUID
	// player identifier
	playerID uuid.UUID
	// stream server protobuf interface
	streamServer pb.GameService_StreamServer
	// Last active time, used for timeout
	activeTime time.Time
	// done channel
	done chan error
}

package entities

import "github.com/google/uuid"

const (
	PaddleSize = 10
)

// Player contains information unique to local and remote players.
type Player struct {
	Entity
}

func NewPlayer(id uuid.UUID) Player {
	return Player{
		Entity: NewBaseEntity(id, ZeroCoordinate())}
}

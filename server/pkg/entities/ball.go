package entities

import (
	"github.com/google/uuid"
)

type Ball struct {
	Entity
	vDirection Direction
}

func NewBall(id uuid.UUID) *Ball {
	return &Ball{
		Entity: &BaseEntity{
			id:        id,
			position:  ZeroCoordinate(),
			direction: DirectionNONE,
		},
		vDirection: DirectionRIGHT,
	}
}

func (e *Ball) VerticalDirection() Direction {
	return e.vDirection
}
func (e *Ball) SetVerticalDirection(direction Direction) {
	e.vDirection = direction
}

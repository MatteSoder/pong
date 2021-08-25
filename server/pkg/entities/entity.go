package entities

import "github.com/google/uuid"

type Entity interface {
	Id() uuid.UUID
	Coordinate() Coordinate
	Direction() Direction
	SetCoordinate(position Coordinate)
	SetDirection(direction Direction)
	DetectCollision(other Entity) bool
}

type BaseEntity struct {
	id        uuid.UUID
	position  Coordinate
	direction Direction
}

func NewBaseEntity(ID uuid.UUID, position Coordinate) Entity {
	return &BaseEntity{
		id:        ID,
		position:  position,
		direction: DirectionNONE,
	}
}

func (e *BaseEntity) Id() uuid.UUID {
	return e.id
}

func (e *BaseEntity) Coordinate() Coordinate {
	return e.position
}
func (e *BaseEntity) Direction() Direction {
	return e.direction
}

func (e *BaseEntity) SetCoordinate(position Coordinate) {
	e.position = position
}
func (e *BaseEntity) SetDirection(direction Direction) {
	e.direction = direction
}

// DetectCollision returns true if receiver object collides with other object.
func (e *BaseEntity) DetectCollision(other Entity) bool {
	p := Coordinate{X: e.Coordinate().X - other.Coordinate().X, Y: e.Coordinate().Y - other.Coordinate().Y}
	dist := p.Length()

	return dist < 2*PaddleSize
}

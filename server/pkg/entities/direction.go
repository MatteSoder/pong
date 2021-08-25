package entities

// Direction is a type describing user input on the paddle.
type Direction int

// Constants describing user input on the paddle.
const (
	DirectionNONE Direction = iota
	DirectionUP
	DirectionDOWN
	DirectionLEFT
	DirectionRIGHT
)

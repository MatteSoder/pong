package entities

import "math"

// Coordinate structs holds 2D vector.
type Coordinate struct {
	X float64
	Y float64
}

// ZeroCoordinate initializes new zero coordinate.
func ZeroCoordinate() Coordinate {
	return Coordinate{X: 0.0, Y: 0.0}
}

// NewCoordinate initlizes new vector with given parameters.
func NewCoordinate(x, y float64) Coordinate {
	return Coordinate{X: x, Y: y}
}

// Length returns length of the coordinate.
func (v *Coordinate) Length() float64 {
	return math.Sqrt(v.X*v.X + v.Y*v.Y)
}

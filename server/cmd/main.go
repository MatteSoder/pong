package main

import (
	"flag"
	"fmt"
	"log"
	"net"

	"github.com/MatteSoder/pong/pb"
	"github.com/MatteSoder/pong/pkg/game"
	"github.com/MatteSoder/pong/pkg/server"

	"google.golang.org/grpc"
)

func main() {
	port := flag.Int("port", 8090, "The port to listen on.")
	flag.Parse()

	log.Printf("listening on port %d", *port)
	lis, err := net.Listen("tcp", fmt.Sprintf(":%d", *port))
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	// Create a new pong game
	pong := game.NewPong()
	// Start game
	pong.Start()

	s := grpc.NewServer()
	server := server.NewGameServer(pong)
	pb.RegisterGameServiceServer(s, server)

	if err := s.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}

GO_DIR=./server
DART_DIR=./client/pong/lib/pb
PROTO_DIR=./protobuf

gen: gen_go gen_dart

gen_go:
	@echo 'generating go protoc'
	@protoc -I=$(PROTO_DIR) \
	--go_out=$(GO_DIR) \
	--go-grpc_out=$(GO_DIR) \
	protobuf/*.proto


gen_dart:
	@echo 'generating dart protoc'
	@protoc -I=$(PROTO_DIR) --dart_out=grpc:$(DART_DIR) protobuf/*.proto


gen_flutter:
	@cd client/pong && flutter packages pub run build_runner build --delete-conflicting-outputs

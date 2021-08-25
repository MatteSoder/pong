import 'dart:async';

import 'package:grpc/grpc_connection_interface.dart';
import 'package:injectable/injectable.dart';
import 'package:pong/pb/pong.pbgrpc.dart' as pb;
import 'package:grpc/grpc.dart';
import 'package:pong/src/data/client/pong_client.dart';
import 'package:pong/src/domain/models/models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:uuid/uuid.dart';

class PongClientOptions {
  /// Request base url, it can contain sub path, like: "https://www.google.com/api/".
  final String baseUrl;

  /// Http request headers. The keys of initial headers will be converted to lowercase,
  /// for example 'Content-Type' will be converted to 'content-type'.
  ///
  /// You should use lowercase as the key name when you need to set the request header.
  final int port;

  /// Timeout in milliseconds for opening url.
  final int? connectTimeout;

  PongClientOptions(
      {required this.baseUrl, required this.port, this.connectTimeout})
      : assert(baseUrl.isNotEmpty);
}

@Named("pong_web")
@LazySingleton(as: PongClient)
class PongWebClientImpl implements PongClient {
  late final _channel;
  late final pb.GameServiceClient _client;
  late final String _id;
  StreamController<pb.StreamRequest> _req = BehaviorSubject();
  StreamController<Ball> _ballStream = BehaviorSubject();
  StreamController<Player> _playerStream = BehaviorSubject();
  StreamController<Player> _opponentStream = BehaviorSubject();

  late StreamSubscription<pb.StreamResponse> _gameSub;

  String? _clientID;

  PongWebClientImpl({required ClientChannelBase channel}) : _channel = channel {
    // Generate a player ID
    _id = Uuid().v4();
    // Initialize client
    _client = pb.GameServiceClient(_channel);
  }
/*
  PongWebClientImpl({@Named('client-config') required PongClientOptions opt}) {
    // Generate a player ID
    _id = Uuid().v4();
    // ClientChannel

    // Initialize channel
    _channel = ClientChannel(
      opt.baseUrl,
      port: opt.port,
      options: ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        connectionTimeout: Duration(seconds: 30),
      ),
    );

    //_channel = GrpcWebClientChannel.xhr(Uri.parse('localhost:8090'));
    // Initialize client
    _client = pb.GameServiceClient(_channel);
  }*/

  @override
  Future connect() async {
    // Connect to the game
    final resp = await _client
        .connect(pb.ConnectRequest(id: _id))
        .catchError((err, stackTrace) => print(err));
    // Handle the response
    _clientID = resp.clientId;
    // Set the initial state of the game
    resp.entities.forEach(_updateEntity);

    // Start listening to incoming.
    _gameSub = _client
        .stream(_req.stream,
            options: CallOptions(metadata: {'client_id': _clientID!}))
        .listen((value) {
      // Handle update entity events
      if (value.hasUpdateEntity()) {
        final e = value.updateEntity.entity;
        _updateEntity(e);
      }
    });
  }

  @override
  Stream<Ball> get ballState => _ballStream.stream;

  @override
  Stream<Player> get opponentState => _opponentStream.stream;

  @override
  Stream<Player> get playerState => _playerStream.stream;

  @override
  void updateMovement(Direction movement) => _req.add(
      pb.StreamRequest(move: pb.Move(direction: parseDirection(movement))));

  @disposeMethod
  void dispose() {
    _gameSub.cancel();
    _ballStream.close();
    _playerStream.close();
    _opponentStream.close();
    _channel.shutdown();
  }

  void _updateEntity(pb.Entity e) {
    if (e.hasPlayer()) {
      final p = e.player.position;
      final player = Player(p.x, p.y);
      print('Update player position: id: ${e.player.id}, Player: $player');
      if (e.player.id == _id) {
        _playerStream.add(player);
      } else {
        _opponentStream.add(player);
      }
    }
    if (e.hasBall()) {
      final p = e.ball.position;
      _ballStream.add(Ball(p.x, p.y));
    }
  }

  pb.Direction parseDirection(Direction dir) {
    switch (dir) {
      case Direction.Up:
        return pb.Direction.DIRECTION_UP;
      case Direction.Down:
        return pb.Direction.DIRECTION_DOWN;
      case Direction.Left:
        return pb.Direction.DIRECTION_LEFT;
      case Direction.Right:
        return pb.Direction.DIRECTION_RIGHT;
    }
  }
}

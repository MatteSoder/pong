import 'dart:async';

import 'package:pong/src/data/client/pong_client.dart';
import 'package:pong/src/domain/models/models.dart';
import 'package:pong/src/domain/repository/game_repository.dart';
import 'package:rxdart/rxdart.dart';

class GameRepositoryImpl implements GameRepository {
  final PongClient _client;
  late StreamController<Ball?> _ball = BehaviorSubject();
  late StreamController<Player?> _player = BehaviorSubject();
  late StreamController<Player?> _opponent = BehaviorSubject();

  GameRepositoryImpl({required PongClient client}) : _client = client;

  void startGame() {
    print('Start game!');

    _client.connect().then((_) {
      _ball.addStream(_client.ballState);
      _player.addStream(_client.playerState);
      _opponent.addStream(_client.opponentState);
    });
  }

  @override
  void updateDirection(Direction direction) {
    print('updateDirection: Direction: $direction');
    _client.updateMovement(direction);
  }

  @override
  Stream<Ball?> get ball => _ball.stream;

  @override
  Stream<Player?> get opponent => _opponent.stream;

  @override
  Stream<Player?> get player => _player.stream;
}

import 'dart:async';

import 'package:pong/src/data/client/pong_client.dart';
import 'package:pong/src/domain/models/models.dart';
import 'package:pong/src/domain/repository/game_repository.dart';
import 'package:rxdart/rxdart.dart';

//@LazySingleton(as: GameRepository)
class GameRepositoryImpl implements GameRepository {
  final PongClient _client;

  GameRepositoryImpl({required PongClient client}) : _client = client;

  StreamController<Direction> _movementController = StreamController();
  late Stream<Ball> _ballSubscription;
  /*StreamController<GameState?> _gameStream = BehaviorSubject.seeded(
    GameState(
      Ball.zero(),
      Player(.9, 0),
      Player(-.9, 0),
    ),
  );*/

  late StreamController<GameState?> _stream = BehaviorSubject();
  late StreamController<Ball?> _ball = BehaviorSubject();
  late StreamController<Player?> _player = BehaviorSubject();
  late StreamController<Player?> _opponent = BehaviorSubject();
  StreamController<GameState?> _gameStream = BehaviorSubject();

  //late Stream<GameState> _gameStream = StreamController.broadcast();

  void startGame() {
    print('Start game!');

    _client.connect().then((_) {
      _ball.addStream(_client.ballState);
      _player.addStream(_client.playerState);
      _opponent.addStream(_client.opponentState);
      final combineStream =
          CombineLatestStream.combine3<Ball, Player, Player, GameState>(
        _client.ballState,
        _client.playerState,
        _client.opponentState,
        (ball, player, opponent) => GameState(ball, player, opponent),
      );

      //_stream = combineStream.asBroadcastStream();
      _stream.addStream(
          combineStream.asBroadcastStream(onListen: (event) => print(event)));
    });

    //ZipStream.zip3<Ball, Player, Player, GameState>(_client.ballState, _client.playerState, _client.opponentState, (ball, player, opponent) => GameState(ball, player, opponent));
  }

  @override
  void updateDirection(Direction direction) {
    print('updateDirection: Direction: $direction');
    _client.updateMovement(direction);
  }

  @override
  Stream<GameState?> get state => _stream.stream;

  @override
  Stream<Ball?> get ball => _ball.stream;

  @override
  Stream<Player?> get opponent => _opponent.stream;

  @override
  Stream<Player?> get player => _player.stream;
}

import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:pong/src/data/client/pong_client.dart';
import 'package:pong/src/domain/models/models.dart';
import 'package:rxdart/rxdart.dart';

@Named("pong_local")
@LazySingleton(as: PongClient)
class PongLocalClientImpl implements PongClient {
  Direction? _horizontalBallDir;
  Direction? _verticalBallDir;

  final double _ballMovement = .01;
  final double _playerMovement = .03;
  late StreamSubscription<Direction> _playerDirSub;
  StreamController<Ball> _ballStream = BehaviorSubject();
  StreamController<Player> _playerStream = BehaviorSubject();
  StreamController<Player> _opponentStream = BehaviorSubject();

  Ball _ball = Ball.zero();
  Player _player = Player(.9, 0);
  Player _opponent = Player(.9, 0);

  /// Determines the balls direction.
  void _updateBallDirection(Ball ball) {
    // Update horizontal direction
    if (ball.x >= 1) {
      _horizontalBallDir = Direction.Left;
    } else if (ball.x <= -1) {
      _horizontalBallDir = Direction.Right;
    }
    // Update vertical direction
    if (ball.y >= 1) {
      _verticalBallDir = Direction.Up;
    } else if (ball.y <= -1) {
      _verticalBallDir = Direction.Down;
    }

    // Check for collision with player
    /*final player = state.player;
    _playerCollision(state.ball, player);    
    final opponent = state.opponent;
    _opponentCollision(state.ball, opponent);*/
    _playerStream.stream.last.then((value) => _playerCollision(ball, value));
    _opponentStream.stream.last
        .then((value) => _opponentCollision(ball, value));
  }

  /// Check for collistion with the players paddle.
  void _playerCollision(Ball b, Player p) {
    if (b.x >= p.x && b.y <= p.y + .1 && b.y >= p.y - .1) {
      // Check if we're hitting the top part of the paddle
      if (b.y >= p.y + .07) {
        _verticalBallDir = Direction.Down;
      } else if (b.y <= p.y - .07) {
        _verticalBallDir = Direction.Up;
      } else {
        _verticalBallDir = null;
      }
      // We now have a collision
      _horizontalBallDir = Direction.Left;
    }
  }

// Check for collistion with the opponents paddle.
  void _opponentCollision(Ball b, Player p) {
    if (b.x <= p.x && b.y <= p.y + .1 && b.y >= p.y - .1) {
      // Check if we're hitting the top part of the paddle
      if (b.y >= p.y + .07) {
        _verticalBallDir = Direction.Down;
      } else if (b.y <= p.y - .07) {
        _verticalBallDir = Direction.Up;
      } else {
        _verticalBallDir = null;
      }
      // We now have a collision
      _horizontalBallDir = Direction.Right;
    }
  }

  /// Updates the ball's position based on the direction.
  void _updateBallPosition(Ball ball) {
    double x = ball.x;
    double y = ball.y;
    // Check horizontal movement.
    switch (_horizontalBallDir) {
      case Direction.Left:
        x -= _ballMovement;
        break;
      case Direction.Right:
        x += _ballMovement;
        break;
      default:
        break;
    }
    // Check vertical movement.
    switch (_verticalBallDir) {
      case Direction.Up:
        y -= _ballMovement / 2;
        break;
      case Direction.Down:
        y += _ballMovement / 2;
        break;
      default:
        break;
    }

    _ballStream.add(ball.copyWith(x: x, y: y));
    return;
  }

  /// Update the Players position based on the Direction.
  void _updatePlayerDirection(Direction direction) {
    // Extract the players Y position.
    double y = _player.y;
    // Determine the new position based on the direction.
    switch (direction) {
      case Direction.Up:
        y -= _playerMovement;
        break;
      case Direction.Down:
        y += _playerMovement;
        break;
      default:
        break;
    }
    // Check if we're out of bounds
    if (y > 1 || y < -1) {
      return;
    }

    _playerStream.add(_player.copyWith(y: y));
  }

  @disposeMethod
  void dispose() {
    _playerDirSub.cancel();
    _ballStream.close();
    _playerStream.close();
    _opponentStream.close();
  }

  @override
  Future connect() async {
    // Set initial ball direction
    _horizontalBallDir = Direction.Right;
    _ballStream.add(_ball);
    _playerStream.add(_player);
    _opponentStream.add(_opponent);

    // Start the gameplay
    Timer.periodic(Duration(milliseconds: 5), (_) async {
      final ball = await _ballStream.stream.last;

      // Update the ball direction.
      _updateBallDirection(ball);
      // Update the ball position.
      _updateBallPosition(ball);
    });
    return;
  }

  @override
  Stream<Ball> get ballState => _ballStream.stream;

  @override
  Stream<Player> get opponentState => _opponentStream.stream;

  @override
  Stream<Player> get playerState => _playerStream.stream;

  @override
  void updateMovement(Direction movement) => _updatePlayerDirection(movement);
}

import 'package:pong/src/domain/models/models.dart';

abstract class GameRepository {
  void startGame();

  /// Listen to the {GameState} stream.
  Stream<GameState?> get state;

  Stream<Ball?> get ball;
  Stream<Player?> get player;
  Stream<Player?> get opponent;

  /// Update the player direction
  void updateDirection(Direction direction);
}

import 'package:pong/src/domain/models/models.dart';

abstract class GameRepository {
  // Starts the game.
  void startGame();

  /// Listen to the ball update stream.
  Stream<Ball?> get ball;

  /// Listen to the player update stream.
  Stream<Player?> get player;

  /// Listen to the opponent update stream.
  Stream<Player?> get opponent;

  /// Update the player direction
  void updateDirection(Direction direction);
}

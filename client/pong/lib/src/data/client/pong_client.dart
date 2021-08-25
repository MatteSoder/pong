import 'package:pong/src/domain/models/models.dart';

abstract class PongClient {
  Future connect();

  void updateMovement(Direction movement);

  Stream<Ball> get ballState;

  Stream<Player> get playerState;
  Stream<Player> get opponentState;

  void dispose();
}

import 'ball.dart';
import 'player.dart';

class GameState {
  final Ball ball;
  final Player player;
  final Player opponent;

  GameState(
    this.ball,
    this.player,
    this.opponent,
  );

  GameState copyWith({
    Ball? ball,
    Player? player,
    Player? opponent,
  }) {
    return GameState(
      ball ?? this.ball,
      player ?? this.player,
      opponent ?? this.opponent,
    );
  }

  @override
  String toString() =>
      'GameState(ball: $ball, player: $player, opponent: $opponent)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GameState &&
        other.ball == ball &&
        other.player == player &&
        other.opponent == opponent;
  }

  @override
  int get hashCode => ball.hashCode ^ player.hashCode ^ opponent.hashCode;
}

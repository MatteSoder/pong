import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pong/src/domain/models/direction.dart';
import 'package:pong/src/domain/models/game_state.dart';
import 'package:pong/src/domain/models/player.dart';
import 'package:pong/src/domain/repository/game_repository.dart';

class PlayerCubit extends Cubit<Player> {
  final GameRepository _repo;
  late StreamSubscription<Player?> _subscription;
  PlayerCubit({required GameRepository repo})
      : _repo = repo,
        super(Player.initial()) {
    // Listen for updates on the player.
    //_subscription = repo.state.listen((event) => emit(event.player));
    _subscription = repo.player
        .where((event) => event != null)
        .listen((event) => emit(event!));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  void moveUp() => _repo.updateDirection(Direction.Up);

  void moveDown() => _repo.updateDirection(Direction.Down);
}

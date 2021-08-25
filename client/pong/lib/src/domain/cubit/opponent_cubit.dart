import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pong/src/domain/models/game_state.dart';
import 'package:pong/src/domain/models/player.dart';
import 'package:pong/src/domain/repository/game_repository.dart';

class OpponentCubit extends Cubit<Player> {
  late StreamSubscription<Player?> _subscription;
  OpponentCubit({required GameRepository repo}) : super(Player.initial()) {
    // Listen for updates on the opponent.
    //_subscription = repo.state.listen((event) => emit(event.opponent));
    _subscription = repo.opponent
        .where((event) => event != null)
        .listen((event) => emit(event!));
  }
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

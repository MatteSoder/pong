import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:pong/src/domain/models/ball.dart';
import 'package:pong/src/domain/models/game_state.dart';
import 'package:pong/src/domain/repository/game_repository.dart';

class BallCubit extends Cubit<Ball> {
  late StreamSubscription<Ball?> _subscription;
  BallCubit({required GameRepository repo}) : super(Ball.zero()) {
    // Listen for updates on the ball.
    _subscription = repo.ball
        .where((event) => event != null)
        .listen((event) => emit(event!));
    //_subscription = repo.state.listen((event) => emit(event.ball));
  }
  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}

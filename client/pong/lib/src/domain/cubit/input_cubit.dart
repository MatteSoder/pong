import 'package:bloc/bloc.dart';
import 'package:pong/src/domain/models/direction.dart';
import 'package:pong/src/domain/repository/game_repository.dart';

class InputCubit extends Cubit<void> {
  final GameRepository _repo;
  InputCubit({required GameRepository repo})
      : _repo = repo,
        super(null);

  void startGame() => _repo.startGame();

  void moveUp() => _repo.updateDirection(Direction.Up);

  void moveDown() => _repo.updateDirection(Direction.Down);
}

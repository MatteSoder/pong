import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pong/di/injectable.dart';
import 'package:pong/src/data/client/pong_client.dart';
import 'package:pong/src/data/repository/game_repository.dart';
import 'package:pong/src/domain/cubit/ball_cubit.dart';
import 'package:pong/src/domain/cubit/input_cubit.dart';
import 'package:pong/src/domain/cubit/opponent_cubit.dart';
import 'package:pong/src/domain/cubit/player_cubit.dart';
import 'package:pong/src/domain/repository/game_repository.dart';
import 'package:pong/src/presentation/game/game_view.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  void initState() {
    // Get the local pong client
    //final gameClient = getIt<PongClient>(instanceName: 'pong_local');
    final gameClient = getIt<PongClient>(instanceName: 'pong_web');

    getIt.registerLazySingleton<GameRepository>(
        () => GameRepositoryImpl(client: gameClient));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<InputCubit>(
          create: (_) => InputCubit(
            repo: getIt<GameRepository>(),
          ),
        ),
        BlocProvider<BallCubit>(
          create: (_) => BallCubit(
            repo: getIt<GameRepository>(),
          ),
        ),
        BlocProvider<PlayerCubit>(
          create: (_) => PlayerCubit(
            repo: getIt<GameRepository>(),
          ),
        ),
        BlocProvider<OpponentCubit>(
          create: (_) => OpponentCubit(
            repo: getIt<GameRepository>(),
          ),
        ),
      ],
      child: GameView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pong/src/domain/cubit/ball_cubit.dart';
import 'package:pong/src/domain/cubit/input_cubit.dart';
import 'package:pong/src/domain/cubit/opponent_cubit.dart';
import 'package:pong/src/domain/cubit/player_cubit.dart';
import 'package:pong/src/domain/models/models.dart' as models;
import 'package:pong/src/presentation/game/widgets/ball.dart';
import 'package:pong/src/presentation/game/widgets/paddle.dart';

class GameView extends StatelessWidget {
  const GameView({Key? key}) : super(key: key);

  void _onKeyEvent(RawKeyEvent event, InputCubit cubit) {
    if (event.isKeyPressed(LogicalKeyboardKey.arrowUp)) {
      cubit.moveUp();
      return;
    } else if (event.isKeyPressed(LogicalKeyboardKey.arrowDown)) {
      cubit.moveDown();
      return;
    } else if (event.isKeyPressed(LogicalKeyboardKey.space)) {
      // Start game by pressing space
      cubit.startGame();
    }
  }

  @override
  Widget build(BuildContext context) {
    final paddleWidth = MediaQuery.of(context).size.width * .01;
    final paddleHeight = MediaQuery.of(context).size.height * .2;
    final ballRadius = MediaQuery.of(context).size.width * .01;

    // Get cubit
    final inputCubit = BlocProvider.of<InputCubit>(context);

    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) => _onKeyEvent(event, inputCubit),
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: Stack(
            children: [
              // Opponents paddle
              BlocBuilder<OpponentCubit, models.Player>(
                buildWhen: (p, c) => p != c,
                builder: (context, state) {
                  return Align(
                    alignment: Alignment(state.x, state.y),
                    child: Paddle(
                      color: Colors.white,
                      width: paddleWidth,
                      height: paddleHeight,
                    ),
                  );
                },
              ),

              // Ball
              BlocBuilder<BallCubit, models.Ball>(
                buildWhen: (p, c) => p != c,
                builder: (context, state) {
                  return Align(
                    alignment: Alignment(state.x, state.y),
                    child: Ball(
                      color: Colors.white,
                      radius: ballRadius,
                    ),
                  );
                },
              ),

              // Player paddle
              BlocBuilder<PlayerCubit, models.Player>(
                buildWhen: (p, c) => p != c,
                builder: (context, state) {
                  return Align(
                    alignment: Alignment(state.x, state.y),
                    child: Paddle(
                      color: Colors.red,
                      width: paddleWidth,
                      height: paddleHeight,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

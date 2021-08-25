import 'package:flutter/material.dart';
import 'package:pong/src/presentation/game/game_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pong Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(),
    );
  }
}

import 'package:flutter/material.dart';

class Paddle extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  const Paddle({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        height: height,
        width: width,
      );
}

import 'package:flutter/material.dart';

class Ball extends StatelessWidget {
  final Color color;
  final double radius;
  const Ball({
    Key? key,
    required this.color,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        height: radius,
        width: radius,
      );
}

import 'package:flutter/material.dart';
import 'package:pong/di/injectable.dart';
import 'package:pong/src/app.dart';

void main() {
  // Initialize dependency injection
  configureDependencies();
  // Run app
  runApp(App());
}

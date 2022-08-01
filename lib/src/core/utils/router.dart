// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:goal_task/src/application/presentation/screens/home_screen/home_screen.dart';

class RoutesNames {
  const RoutesNames._();

  static const String start = '/';
  static const String home = "Home";
}

// ignore: missing_return
Route<dynamic>? generateRoute(RouteSettings routeSettings) {
  final args = (routeSettings.arguments) as Map<String, dynamic>? ?? {};

  switch (routeSettings.name) {
    case RoutesNames.home:
      return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}

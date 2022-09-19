// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:goal_task/src/application/presentation/screens/buy_car_screen/buy_car_screen.dart';
import 'package:goal_task/src/application/presentation/screens/goal_screen/goal_screen.dart';
import 'package:goal_task/src/application/presentation/screens/home_screen/home_screen.dart';

class RoutesNames {
  const RoutesNames._();

  static const String start = '/';
  static const String home = "Home";
  static const String goal = "Goal";
  static const String buy_car = "Buy_Car";
}

// ignore: missing_return
Route<dynamic>? generateRoute(RouteSettings routeSettings) {
  final args = (routeSettings.arguments) as Map<String, dynamic>? ?? {};

  switch (routeSettings.name) {
    case RoutesNames.home:
      return MaterialPageRoute(builder: (_) => HomeScreen());
    case RoutesNames.goal:
      return MaterialPageRoute(builder: (_) => GoalScreen());
    case RoutesNames.buy_car:
      return MaterialPageRoute(builder: (_) => BuyCarScreen());
  }
}

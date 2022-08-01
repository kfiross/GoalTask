import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:goal_task/src/core/injector_container.dart';
import 'package:goal_task/src/core/managers/hive.dart';

import 'src/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await initHive();
  initLocator();
  runApp(const App());
}
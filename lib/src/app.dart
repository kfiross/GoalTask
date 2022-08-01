import 'package:flutter/material.dart';
import 'package:goal_task/src/application/presentation/screens/home_screen/home_screen.dart';

import 'application/presentation/screens/splash_screen.dart';
import 'core/consts/app_themes.dart';
import 'core/utils/size_config.dart';
import 'core/utils/router.dart' as router;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoalTask',
      home: _home(),
      builder: (ctx, child) {
        SizeConfig().init(ctx);
        return child!;
      },
      theme: AppThemes.defaultTheme(context),
      onGenerateRoute: router.generateRoute,
    );
  }

  Widget _home() {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 2000)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return HomeScreen();
        }
        return const SplashScreen();
      },
    );
  }
}
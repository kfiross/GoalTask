import 'package:flutter/material.dart';
import 'package:goal_task/src/core/utils/size_config.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Center(
          //   child: Image.asset('assets/images/app_logo_big.jpeg'),
          // ),
          Center(
            child: Text("GoalTask", style: TextStyle(fontSize: SizeConfig.font.huge, fontWeight: FontWeight.bold),),
          ),
          const Positioned(
              left: 0, right: 0, bottom: 48, child: Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:goal_task/src/application/data/model/task_model.dart';
import 'package:goal_task/src/application/presentation/drawers/app_drawer.dart';
import 'state/goal_screen_bloc.dart';
import 'package:goal_task/src/application/presentation/widgets/items/task_item.dart';
import 'package:goal_task/src/core/consts/app_colors.dart';
import 'package:goal_task/src/core/enums.dart';
import 'package:goal_task/src/core/injector_container.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'state/goal_screen_events.dart';

/* typedef TasksBlocBuilder
    = SealedBlocBuilder4<HomeCubit, BaseHomeState, Initial, Loading, Success, Failure>; */

class GoalScreen extends StatelessWidget {
  GoalScreen({Key? key}) : super(key: key);

  Widget _body() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search',
              ),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buyingTile()),
              const SizedBox(width: 20),
              Expanded(child: _assimilationTile()),
              Expanded(child: _Vacations()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buyingTile() {
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Buying products",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _assimilationTile() {
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Assimilation tasks",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _Vacations() {
    return SizedBox(
      height: 100,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Vacations",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
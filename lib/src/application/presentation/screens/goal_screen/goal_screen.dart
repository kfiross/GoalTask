import 'dart:ui';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _appBar(),
            Expanded(child: _body()),
          ],
        ),
        drawer: AppDrawerNavigation(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
    );
  }

  Widget _body() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search',
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Expanded(child: _buyingTile()),
              // const SizedBox(height: 10),
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
      height: 15,
      child: ElevatedButton(
        onPressed: () {
          BuyingProducts();
        },
        child: const Text("Buying products",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _assimilationTile() {
    return SizedBox(
      height: 15,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Assimilation tasks",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _Vacations() {
    return SizedBox(
      height: 15,
      child: ElevatedButton(
        onPressed: () {},
        child: const Text("Vacations",
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ),
    );
  }

  /* Widget _Buy_car() {
    return SizedBox(
        height: 30,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("BUY CAR",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
        ));
  } */
}

class BuyingProducts extends StatefulWidget {
  const BuyingProducts({Key? key}) : super(key: key);

  @override
  State<BuyingProducts> createState() => BuyingProductsWidgetState();
}

class BuyingProductsWidgetState extends State<BuyingProducts> {
  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 18,
          child: SizedBox(
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("BUY CAR",
                    style:
                        TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
              )),
        ),
      ],
    );
  }
}

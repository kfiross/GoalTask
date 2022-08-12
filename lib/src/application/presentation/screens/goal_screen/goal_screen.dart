import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal_task/src/application/data/model/task_model.dart';
import 'package:goal_task/src/application/presentation/drawers/app_drawer.dart';
import 'package:goal_task/src/core/utils/size_config.dart';
import 'state/goal_screen_bloc.dart';
import 'package:goal_task/src/application/presentation/widgets/items/task_item.dart';
import 'package:goal_task/src/core/consts/app_colors.dart';
import 'package:goal_task/src/core/enums.dart';
import 'package:goal_task/src/core/injector_container.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';

import 'state/goal_screen_events.dart';

import 'subpages.dart';

/* typedef TasksBlocBuilder
    = SealedBlocBuilder4<HomeCubit, BaseHomeState, Initial, Loading, Success, Failure>; */

class GoalScreen extends StatefulWidget {
  GoalScreen({Key? key}) : super(key: key);

  @override
  State<GoalScreen> createState() => _GoalScreenState();
}

class _GoalScreenState extends State<GoalScreen> {
  Widget? widgetToShow;
  int _selected = -1;

  final _widgets = [
    const BuyingProductsWidget(),
    const AssimilationTasksWidget(),
    const VacationWidget(),
  ];

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
    final size = MediaQuery.of(context).size.width - 28;
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const TextField(
            decoration: const InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Search',
            ),
          ),
          const SizedBox(height: 8),

          /// ALWAYS USE x%4 == 0 numbers
          Row(
            children: [
              /// we should use "ToggleButton" widget (smartly)
              ToggleButtons(
                children: [
                  SizedBox(
                      width: size / 3,
                      child: const Text(
                        "Buying products",
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                      width: size / 3,
                      child: const Text(
                        "Assimilation tasks",
                        textAlign: TextAlign.center,
                      )),
                  SizedBox(
                      width: size / 3,
                      child: const Text(
                        "Vacations",
                        textAlign: TextAlign.center,
                      )),
                ],
                isSelected: [
                  _selected == 1,
                  _selected == 2,
                  _selected == 3,
                ],
                textStyle: TextStyle(fontSize: SizeConfig.font.small_plus),
                onPressed: (index) {
                  setState(() {
                    _selected = index + 1;
                    widgetToShow = _widgets[index];
                  });
                },
              )
              // Expanded(child: _buyingTile()),
              // const SizedBox(width: 8),
              // Expanded(child: _assimilationTile()),
              // const SizedBox(width: 8),
              // Expanded(child: _Vacations()),
            ],
          ),
          if (widgetToShow != null) ...{
            const SizedBox(height: 8),
            Container(
              child: widgetToShow!,
            )
          }
        ],
      ),
    );
  }

// Widget _buyingTile() {
//   return SizedBox(
//     height: 44,
//     child: ElevatedButton(
//       onPressed: () {
//         setState(() {
//           widgetToShow = const BuyingProductsWidget();
//         });
//       },
//       style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(4)),
//       child: Text(
//         "Buying products",
//         style: TextStyle(
//           fontSize: SizeConfig.font.small_plus,
//           fontWeight: FontWeight.bold,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//   );
// }
//
// Widget _assimilationTile() {
//   return SizedBox(
//     height: 44,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(4)),
//       onPressed: () {
//         setState(() {
//           widgetToShow = const AssimilationTasksWidget();
//         });
//       },
//       child: Text(
//         "Assimilation tasks",
//         style: TextStyle(
//           fontSize: SizeConfig.font.small_plus,
//           fontWeight: FontWeight.bold,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//   );
// }
//
// Widget _Vacations() {
//   return SizedBox(
//     height: 44,
//     child: ElevatedButton(
//       style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(4)),
//       onPressed: () {
//         setState(() {
//           widgetToShow = const VacationWidget();
//         });
//       },
//       child: Text(
//         "Vacations",
//         style: TextStyle(
//           fontSize: SizeConfig.font.small_plus,
//           fontWeight: FontWeight.bold,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//   );
// }
}

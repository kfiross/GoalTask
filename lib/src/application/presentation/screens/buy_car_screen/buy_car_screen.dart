import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal_task/custom_icons_icons.dart';
import 'package:goal_task/src/application/data/model/task_model.dart';
import 'package:goal_task/src/application/presentation/drawers/app_drawer.dart';
import 'package:goal_task/src/core/utils/size_config.dart';
import 'package:goal_task/src/application/presentation/widgets/items/task_item.dart';
import 'package:goal_task/src/core/consts/app_colors.dart';
import 'package:goal_task/src/core/enums.dart';
import 'package:goal_task/src/core/injector_container.dart';
import 'package:goal_task/custom_icons_icons.dart';
import 'package:sealed_flutter_bloc/sealed_flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'subpages.dart';

/* typedef TasksBlocBuilder
    = SealedBlocBuilder4<HomeCubit, BaseHomeState, Initial, Loading, Success, Failure>; */

class BuyCarScreen extends StatefulWidget {
  const BuyCarScreen({Key? key}) : super(key: key);

  @override
  State<BuyCarScreen> createState() => _BuyCarScreenState();
}

class _BuyCarScreenState extends State<BuyCarScreen> {
  Widget? widgetToShow;
  // int _selected = -1;

  final _widgets = [
    const PriceWidget(),
    const ManufacturerWidget(),
    const ModelWidget(),
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
    final size = MediaQuery.of(context).size.width;
    return Container(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          const SizedBox(height: 8),

          /// ALWAYS USE x%4 == 0 numbers
          Row(
            children: [
              SizedBox(
                  width: size / 3,
                  child: const Text(
                    "Buying products",
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                  width: size / 4,
                  child: const Text(
                    "Buy car",
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
          SizedBox(
              child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 8,
            shadowColor: Colors.grey.shade200,
            margin: const EdgeInsets.all(20),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade200, width: 1)),
            child: Column(
              children: [
                Row(children: [
                  const SizedBox(height: 8),
                  SizedBox(
                      width: size / 4,
                      child: const Text(
                        "Buy car \n",
                        textAlign: TextAlign.center,
                      )),
                ]),
                Row(children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        widgetToShow = _widgets[0];
                      });
                    },
                    child: SizedBox(
                        width: size / 4,
                        child: const Text(
                          "Price",
                          textAlign: TextAlign.center,
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widgetToShow = _widgets[1];
                      });
                    },
                    child: SizedBox(
                        width: size / 4,
                        child: const Text(
                          "Manufacturer",
                          textAlign: TextAlign.center,
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        widgetToShow = _widgets[2];
                      });
                    },
                    child: SizedBox(
                        width: size / 3,
                        child: const Text(
                          "Model",
                          textAlign: TextAlign.center,
                        )),
                  ),
                ]),
                Row(children: [
                  SizedBox(
                    width: size / 11,
                  ),
                  const Icon(Custom_icons.numeric_1_circle_outline),
                  SizedBox(
                    width: size / 5,
                  ),
                  const Icon(Custom_icons.numeric_2_circle_outline),
                  SizedBox(
                    width: size / 4.5,
                  ),
                  const Icon(Custom_icons.numeric_3_circle_outline),
                ]),
                Row(children: [
                  SizedBox(
                    width: size / 100,
                  ),
                  SvgPicture.asset(
                    "svgs/right_arrow.svg",
                  )
                ]),
              ],
            ),
          )),
          Row(children: [
            if (widgetToShow != null) ...{
              // const SizedBox(height: 8),
              // Container(
              // child:
              widgetToShow!,
              // )
            }
          ])
        ]));
  }
}

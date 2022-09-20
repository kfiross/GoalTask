import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';
import 'package:goal_task/src/application/presentation/screens/buy_car_screen/subpages/price_widget/price_widget.dart';
import 'package:provider/provider.dart';

class MoneyAvailable extends StatefulWidget {
  const MoneyAvailable({Key? key}) : super(key: key);
  static ValueNotifier<int> sum = ValueNotifier<int>(0);

  @override
  State<MoneyAvailable> createState() => _MoneyAvailable();
}

class _MoneyAvailable extends State<MoneyAvailable> {
  late TextEditingController current;
  late TextEditingController savings;

  Widget? widgetToShow;

  void _calculate() {
    setState(() {
      MoneyAvailable.sum.value = (current2 + savings2);
    });
  }

  // bool isVisible = true;
  int current2 = 0;
  int savings2 = 0;
  @override
  void initState() {
    super.initState();
    current = TextEditingController();
    savings = TextEditingController();
  }

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  // final current = TextEditingController();
  // final savings = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    current.dispose();
    savings.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
            alignment: Alignment.topRight,
            width: 150,
            height: 200,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 252, 183, 1),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
                alignment: Alignment.topRight,
                child: Column(children: [
                  Row(
                    children: const [Text("Money Available")],
                  ),
                  Row(children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(labelText: "Current"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSubmitted: (String value) {},
                        onChanged: (value) {
                          current2 = int.tryParse(value) ?? 0;
                          _calculate();
                        },
                        controller: current,
                      ),
                    )
                  ]),

                  Row(children: [
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(labelText: "Savings"),
                        keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onSubmitted: (String value) {},
                        onChanged: (value2) {
                          savings2 = int.tryParse(value2) ?? 0;
                          _calculate();
                        },
                        controller: savings,
                      ),
                    )
                  ]),
                  Expanded(
                      child: Row(children: [
                    const Text(
                      "Sum\n\n\n",
                      textAlign: TextAlign.left,
                    ),
                    if (MoneyAvailable.sum.value != 0) ...{
                      Text("${MoneyAvailable.sum.value}"),
                    }
                  ])),

                  // if (widgetToShow != null) ...{
                  //   const SizedBox(height: 8),
                  //   Container(
                  //     child: widgetToShow!,
                  //   )
                  // }
                ]))));
  }
}

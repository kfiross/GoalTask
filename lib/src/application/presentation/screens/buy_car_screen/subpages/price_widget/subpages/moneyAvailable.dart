import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';
import 'package:goal_task/src/application/presentation/screens/buy_car_screen/subpages/price_widget/price_widget.dart';
import 'package:provider/provider.dart';

class MoneyAvailable extends StatefulWidget {
  ValueNotifier<int> sumMoneyAvailable = ValueNotifier<int>(0);
  MoneyAvailable(money, {Key? key}) : super(key: key);
  // Money(ValueNotifier<int> sumMoneyAvailable) {
  //   this.sumMoneyAvailable = sumMoneyAvailable;
  // }

  @override
  State<MoneyAvailable> createState() => _MoneyAvailable();
}

class _MoneyAvailable extends State<MoneyAvailable> {
  late TextEditingController current;
  late TextEditingController savings;

  Widget? widgetToShow;

  final _widgets = [
    PriceWidget(),
    // const (),
    // const (),
  ];

  void _calculate() {
    widget.sumMoneyAvailable.value = current2 + savings2;
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
    return Stack(
      children: [
        Container(
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 252, 183, 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          // child: Center(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Money Available", style: TextStyle(fontSize: 20),
                  // textAlign: TextAlign.center,
                ),
                TextField(
                  style: const TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
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
                  // controller: current,
                ),
                TextField(
                  style: const TextStyle(color: Colors.blue),
                  textAlign: TextAlign.center,
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
                const Text(
                  "\n\n\nSum\n\n\n",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15),
                ),
                if (widget.sumMoneyAvailable.value != 0) ...{
                  Text("${widget.sumMoneyAvailable.value}"),
                },
                Expanded(
                    child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            widgetToShow = _widgets[0];
                            FocusManager.instance.primaryFocus?.unfocus();
                          });
                        },
                        child: const SizedBox(
                            child: Text(
                          "\n<",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        )))
                  ],
                ))
              ]),
          // )
        ),
        if (widgetToShow != null) ...{
          const SizedBox(height: 8),
          Container(
            child: widgetToShow!,
          )
        }
      ],
    );
  }
}

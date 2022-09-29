import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';
import 'package:goal_task/src/application/presentation/screens/buy_car_screen/subpages/price_widget/price_widget.dart';
import 'package:provider/provider.dart';


class FinancialLoans extends StatefulWidget {
  FinancialLoans({Key? key}) : super(key: key);
  ValueNotifier<int> sumFinancialLoans = ValueNotifier<int>(0);

  @override
  State<FinancialLoans> createState() => _FinancialLoans();
}

class _FinancialLoans extends State<FinancialLoans> {
  late TextEditingController companyA;
  late TextEditingController companyB;

  Widget? widgetToShow;

  final _widgets = [
    const PriceWidget(),
    // const (),
    // const (),
  ];

  void _calculate() {
    sumFinancialLoans.value = companyA2 + companyB2;
  }

  // bool isVisible = true;
  int companyA2 = 0;
  int companyB2 = 0;
  @override
  void initState() {
    super.initState();
    companyA = TextEditingController();
    companyB = TextEditingController();
  }

  // Create a text controller and use it to retrieve the companyA value
  // of the TextField.
  // final companyA = TextEditingController();
  // final companyB = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    companyA.dispose();
    companyB.dispose();
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
            child: Column(children: [
              const Text(
                "Financial Loans\n",
                style: TextStyle(fontSize: 20),
              ),
              Row(
                children: const [
                  Text("Link to our database"),
                ],
              ),
              Row(children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.blue),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(labelText: "Company A"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onSubmitted: (String value) {},
                    onChanged: (value) {
                      companyA2 = int.tryParse(value) ?? 0;
                      _calculate();
                    },
                    controller: companyA,
                  ),
                )
              ]),
              Row(children: [
                Expanded(
                  child: TextField(
                    style: const TextStyle(color: Colors.blue),
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(labelText: "Company B"),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onSubmitted: (String value) {},
                    onChanged: (value2) {
                      companyB2 = int.tryParse(value2) ?? 0;
                      _calculate();
                    },
                    controller: companyB,
                  ),
                )
              ]),
              Row(
                children: [
                  Text(
                    "\nSum\n",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 15),
                  ),
                  if (sumFinancialLoans.value != 0) ...{
                    Text(" ${sumFinancialLoans.value}"),
                  },
                ],
              ),
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
            ])),
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

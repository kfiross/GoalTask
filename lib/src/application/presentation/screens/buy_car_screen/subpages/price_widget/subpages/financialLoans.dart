import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/painting.dart';
import 'package:goal_task/src/application/presentation/screens/buy_car_screen/subpages/price_widget/price_widget.dart';
import 'package:provider/provider.dart';

class FinancialLoans extends StatefulWidget {
  const FinancialLoans({Key? key}) : super(key: key);
  static ValueNotifier<int> sum = ValueNotifier<int>(0);

  @override
  State<FinancialLoans> createState() => _FinancialLoans();
}

class _FinancialLoans extends State<FinancialLoans> {
  late TextEditingController companyA;
  late TextEditingController companyB;

  Widget? widgetToShow;

  void _calculate() {
    setState(() {
      FinancialLoans.sum.value = (companyA2 + companyB2);
    });
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
                    children: const [Text("Financial Loans\n")],
                  ),
                  Row(
                    children: const [Text("Link to our database")],
                  ),
                  Row(children: [
                    Expanded(
                      child: TextField(
                        decoration:
                            const InputDecoration(labelText: "Company A"),
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
                        decoration:
                            const InputDecoration(labelText: "Company B"),
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
                  Expanded(
                      child: Row(children: [
                    const Text(
                      "Sum\n\n\n",
                      textAlign: TextAlign.left,
                    ),
                    if (FinancialLoans.sum.value != 0) ...{
                      Text("${FinancialLoans.sum.value}"),
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

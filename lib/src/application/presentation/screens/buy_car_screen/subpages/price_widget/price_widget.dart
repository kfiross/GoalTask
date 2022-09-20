import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'subpages.dart';

class PriceWidget extends StatefulWidget {
  const PriceWidget({Key? key}) : super(key: key);

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  Widget? widgetToShow;
  FontWeight fontMoneyAvailable = FontWeight.normal;
  FontWeight fontFinancialLoans = FontWeight.normal;

  final _widgets = [
    const MoneyAvailable(),
    const FinancialLoans(),
    // const (),
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            alignment: Alignment.topLeft,
            width: 150,
            height: 200,
            decoration: const BoxDecoration(
                color: Color.fromRGBO(245, 252, 183, 1),
                // border: Border.all(
                //   color: Colors.white,
                //   width: 25.0,
                //   //   style: BorderStyle.solid,
                // ),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Container(
                alignment: Alignment.topLeft,
                child: Column(children: [
                  Row(children: const [
                    SizedBox(height: 8),
                    SizedBox(
                        child: Text(
                      "Price\n",
                      textAlign: TextAlign.center,
                    )),
                  ]),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              widgetToShow = _widgets[0];
                              fontMoneyAvailable = FontWeight.bold;
                              fontFinancialLoans = FontWeight.normal;
                            });
                          },
                          child: SizedBox(
                              child: Text("Money available",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      fontWeight: fontMoneyAvailable)))),
                    ],
                  ),
                  Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: MoneyAvailable.sum,
                        builder: (context, value, child) {
                          if (value != 0) {
                            return Text(
                              value.toString(),
                              textAlign: TextAlign.left,
                            );
                          } else {
                            return const Text("");
                          }
                        },
                      ),
                    ],
                  ),
                  Row(children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            widgetToShow = _widgets[1];
                            fontFinancialLoans = FontWeight.bold;
                            fontMoneyAvailable = FontWeight.normal;
                          });
                        },
                        child: SizedBox(
                            child: Text("\nFinancial loans",
                                textAlign: TextAlign.left,
                                style:
                                    TextStyle(fontWeight: fontFinancialLoans))))
                  ]),
                  Row(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: FinancialLoans.sum,
                        builder: (context, value, child) {
                          if (value != 0) {
                            return Text(
                              value.toString(),
                              textAlign: TextAlign.left,
                            );
                          } else {
                            return const Text("");
                          }
                        },
                      ),
                    ],
                  ),
                ]))),
        if (widgetToShow != null) ...{
          const SizedBox(
            width: 16,
            height: 8,
          ),
          Container(alignment: Alignment.bottomRight, child: widgetToShow!)
        }
      ],
    );
  }
}

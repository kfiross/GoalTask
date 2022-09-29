import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:goal_task/src/application/presentation/screens/buy_car_screen/subpages.dart';
import 'package:provider/provider.dart';
import 'subpages.dart';

class PriceWidget extends StatefulWidget {
  final ValueNotifier<int> sumMoneyAvailable;
  PriceWidget(this.sumMoneyAvailable, {Key? key}) : super(key: key);

 ValueNotifier<int> sumPriceWidget = ValueNotifier<int>(0);

  @override
  State<PriceWidget> createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  Widget? widgetToShow;
  FontWeight fontMoneyAvailable = FontWeight.normal;
  FontWeight fontFinancialLoans = FontWeight.normal;

  final _widgets = [
    MoneyAvailable(),
    FinancialLoans(),
    // const (),
  ];

  @override
  Widget build(BuildContext context) {
    // final sizeWidth = MediaQuery.of(context).size.width;
    // final sizeHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          // alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(245, 252, 183, 1),
              // border: Border.all(
              //   color: Colors.white,
              //   width: 25.0,
              //   //   style: BorderStyle.solid,
              // ),
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            // alignment: Alignment.topCenter,
            children: [
              // Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              // Row(children: const [
              const Text(
                "Price\n",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
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
                          child: Text("\nMoney available",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: fontMoneyAvailable,
                              )))),
                ],
              ),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: widget.sumMoneyAvailable,
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

              Row(
                children: [
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
                                  TextStyle(fontWeight: fontFinancialLoans)))),
                ],
              ),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: widget.sumMoneyAvailable,
                    builder: (context, value, child) {
                      widget.sumPriceWidget.value =
                          widget.sumMoneyAvailable.value + sumFinancialLoans.value;
                      if (value != 0) {
                        return Text(
                          value.toString(),
                          textAlign: TextAlign.center,
                        );
                      } else {
                        return const Text("");
                      }
                    },
                  ),
                ],
              ),
              Row(
                children: const [
                  Text(
                    "\n\nSum",
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              Row(
                children: [
                  if (widget.sumPriceWidget.value != 0) ...{
                    Text(
                      "${widget.sumPriceWidget.value}",
                      textAlign: TextAlign.left,
                    ),
                  },
                ],
              )
            ],
          ),
        ),
        if (widgetToShow != null) ...{
          // const SizedBox(
          //   width: 150,
          //   height: 200,
          // ),
          Container(alignment: Alignment.bottomRight, child: widgetToShow!)
        }
      ],
    );
  }
}

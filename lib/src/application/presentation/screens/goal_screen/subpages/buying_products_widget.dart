import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goal_task/src/core/utils/router.dart';

final List<String> types = [
  "Buy Car",
  "Buy Air Conditioner",
  "Buy ??",
  "Buy ??",
  "Buy ??",
  "Buy ??",
];

class BuyingProductsWidget extends StatelessWidget {
  const BuyingProductsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: @liron continue implement this
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, mainAxisSpacing: 12, crossAxisSpacing: 8),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, RoutesNames.buy_car);
                break;

              case 1:
                {
                  //statements;
                }
                break;

              default:
                {
                  //statements;
                }
                break;
            }
          },
          child: Text(
            "${types[index]}",
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

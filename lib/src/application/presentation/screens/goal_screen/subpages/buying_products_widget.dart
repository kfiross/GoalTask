import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 8
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {

          },
          child: Text("${types[index]}", textAlign: TextAlign.center,),
        );
      },
    );
  }
}

// _toFix(){
//   return Container(
//     height: 200,
//     child: Card(
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text("Buy Car"),
//                     Icon(Icons.drive_eta),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

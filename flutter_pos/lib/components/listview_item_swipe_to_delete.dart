// import 'package:flutter/material.dart';
//
// class ListViewItemSwipeToDelete extends StatelessWidget {
//
//   ListViewItemSwipeToDelete(this.obj, this.itemWidgetFunction, {
//     super.key
//   });
//
//   Function itemWidgetFunction;
//   dynamic obj;
//
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: Key(obj),
//       direction: DismissDirection.endToStart,
//       onDismissed: (direction) {
//       },
//       background: Container(
//         color: Colors.red,
//         alignment: Alignment.centerRight,
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         child: Icon(
//           Icons.delete,
//           color: Colors.white,
//         ),
//       ),
//       child: itemWidgetFunction,
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import '../providers/type/paging_list_provider.dart';
//
// class PagingListViewSwipeToDelete extends StatelessWidget {
//   PagingListProvider parentListProvider;
//   Function itemWidgetFunction;
//   PagingListViewSwipeToDelete(this.parentListProvider, this.itemWidgetFunction, {
//     super.key
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         padding: const EdgeInsets.all(0.0),
//         controller: parentListProvider.scrollController,
//         child: ListView.builder(
//           itemCount: parentListProvider.list.length,
//           itemBuilder: (context, index) {
//             dynamic item = parentListProvider.list[index];
//             // return itemWidgetFunction(item);
//             return Dismissible(
//               key: Key(parentListProvider.list[index]),
//               direction: DismissDirection.endToStart,
//               onDismissed: (direction) {
//                 // _showDeleteDialog(index);
//                 print('direction : $direction');
//               },
//               background: Container(
//                 color: Colors.red,
//                 alignment: Alignment.centerRight,
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Icon(
//                   Icons.delete,
//                   color: Colors.white,
//                 ),
//               ),
//               child: ListTile(
//                 title: Text(''),
//               ),
//             );
//           },
//             // padding: const EdgeInsets.all(0.0),
//             // itemCount: parentListProvider.list.length,
//             // shrinkWrap: true,
//             // physics: const NeverScrollableScrollPhysics(),
//             // itemBuilder: (context, index) {
//             //   dynamic item = parentListProvider.list[index];
//             //   return itemWidgetFunction(item);
//             // }
//         ),
//       ),
//     );
//   }
// }

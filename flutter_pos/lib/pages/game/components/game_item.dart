// import 'package:flutter/material.dart';
//
// import '../../../models/game.dart';
//
// class GameItem extends StatefulWidget {
//   GameItem(this.game, {super.key});
//   Game game;
//   @override
//   State<GameItem> createState() => _GameItemState();
// }
//
// class _GameItemState extends State<GameItem> {
//   bool status = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8.0),
//         color: Colors.white.withOpacity(0.05),
//       ),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(8.0),
//         onTap: () {
//         },
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             contentView(),
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget getTextNumber(BuildContext context, String text) {
//     return Text(
//       text,
//       style: const TextStyle(fontSize: 10),
//     );
//   }
//
//
//   Widget contentView() {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         for (int i = 0; i < 5; i++) ...[
//           if (i < widget.game.numbers.length)
//             getTextNumber(context, widget.game.numbers[i]?.toString() ?? ''),
//           const SizedBox(width: 10),
//         ],
//       ],
//     );
//   }
//
// }

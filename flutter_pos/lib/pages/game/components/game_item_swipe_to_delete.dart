import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/game.dart';
import '../../../providers/game_provider.dart';

class GameItemSwipeToDelete extends StatefulWidget {
  GameItemSwipeToDelete(this.game, {super.key});
  Game game;
  @override
  State<GameItemSwipeToDelete> createState() => _GameItemSwipeToDeleteState();
}

class _GameItemSwipeToDeleteState extends State<GameItemSwipeToDelete> {
  bool status = true;


  Future<bool?> _showDeleteDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white.withOpacity(0.05),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
        },
        child: Dismissible(
          key: Key(widget.game.numbers.toString()),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            print('onDismissed > direction : $direction');
            Provider.of<GameProvider>(context, listen: false).removeGame(widget.game);
          },
          confirmDismiss: (direction) async {
            final bool? result = await _showDeleteDialog();
            print('confirmDismiss > result : $result');
            return result == true;
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contentView(),
            ],
          ),
        ),
      ),
    );
  }


  Widget getNumber(BuildContext context, String text) {
    print('getTextNumber > text : $text');
    return Text(
      text,
      style: const TextStyle(color: Colors.red, fontSize: 15),
    );
  }

  Widget getSelectedNumber(BuildContext context, String text) {
    print('getSelectedNumber > text : $text');
    return Text(
      text,
      style: const TextStyle(fontSize: 15),
    );
  }


  Widget contentView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getNumber(context, widget.game.id.toString()),
          const SizedBox(width: 20),

          for (int i = 0; i < 5; i++) ...[
            if (i < widget.game.numbers.length)
              getSelectedNumber(context, widget.game.numbers[i]?.toString() ?? ''),
            const SizedBox(width: 10),
          ],
        ],
      ),
    );
  }

}

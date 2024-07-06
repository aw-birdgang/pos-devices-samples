import 'package:flutter/material.dart';

import '../../../components/paging_listview.dart';
import '../../../models/game.dart';
import '../../../providers/game_provider.dart';
import '../../../shared/constants.dart';
import 'game_item.dart';
import 'game_item_swipe_to_delete.dart';
import 'game_number_scroll.dart';

class GameDetail extends StatefulWidget {

  GameDetail(this.gameProvider, {
    super.key
  });

  GameProvider gameProvider;

  @override
  State<GameDetail> createState() => _GameDetailState();
}

class _GameDetailState extends State<GameDetail> {
  late GameProvider gameProvider;

  bool status = true;

  Widget itemWidget(Game item) {
    return GameItemSwipeToDelete(item, key: Key("game_${item.id}"));
  }

  @override
  Widget build(BuildContext context) {
    gameProvider = widget.gameProvider;
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: secondaryColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PagingListView(gameProvider, itemWidget),
          const Divider(thickness: 2,),
          const GameNumberScroll(),
        ],
      ),
    );
  }

}
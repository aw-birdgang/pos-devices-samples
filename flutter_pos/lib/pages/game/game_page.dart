import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/game_provider.dart';
import 'components/game_detail.dart';


class GamePage extends StatefulWidget {
  const GamePage({super.key});
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ChangeNotifierProvider<GameProvider>(
        create: (context) => GameProvider(),
        child: Consumer<GameProvider>(
          builder: (context, provider, child) {
            return GameDetail(provider);
          },
        ),
      )
    );
  }
}
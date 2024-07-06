
import 'dart:math';

import 'package:flutter_pos/providers/type/paging_list_provider.dart';

import '../common/constrant.dart';
import '../models/game.dart';

class GameProvider extends PagingListProvider {
  final int maxGames = 5;

  GameProvider() {
    init();
  }

  // void addNumberInGame(int number) {
  //   if (_games.length < 5 && !_games.contains(number)) {
  //     _game.addNumber(number);
  //   }
  // }

  removeGame(Game game) {
    if (list.length > 1 && list.contains(game)) {
      list.remove(game);
    }
    totalCount = list.length;
    print('## removeGame >> totalCount : $totalCount');
    notifyListeners();
  }

  void addGameNumbers(List<int> selectedNumbers) {
    Game game = Game();
    game.id = totalCount + 1;
    game.addNumbers(selectedNumbers);
    List<Game> _games = [];
    _games.add(game);

    if (list.length < 5 && !list.contains(game)) {
      list.addAll(_games);
    }
    totalCount = list.length;
    print('## addGameNumbers >> totalCount : $totalCount');
    notifyListeners();
  }

  List<int> generateRandomLottoNumbers() {
    final random = Random();
    final Set<int> lottoNumbers = {};
    while (lottoNumbers.length < 5) {
      lottoNumbers.add(random.nextInt(45) + 1);
    }
    return lottoNumbers.toList()..sort();
  }

  String printTicket () {
    StringBuffer buffer = StringBuffer();
    for (int i=0; i<list.length; i++) {
      Game game = list[i];
      String result = game.numbers.toString();
      buffer.writeln(result);
      print('## printTicket : $result');
    }
    return buffer.toString();
  }

  @override
  Future<void> fetchList({int? page, int size = FETCH_SIZE}) async {
    try {
      int fetchPage = page ?? currentPage;
      clear();
      startLoading();
      // Game game = Game();
      // game.id = 1;
      // for (int i=0; i<5; i++) {
      //   game.addNumber(i);
      // }
      // _games.add(game);
      // list.addAll(_games);
      // list.addAll(await DepositApi().getDepositList(fetchPage));
      // totalCount = DepositApi().totalCount;
      totalCount = list.length;
      print('## totalCount : $totalCount');
      stopLoading();
    } catch (e) {
      print('## getDepositList() error >> ${e.toString()}');
    }
  }
}

import 'package:flutter_pos/providers/type/paging_list_provider.dart';

import '../common/constrant.dart';

class SettingProvider extends PagingListProvider {
  final int maxGames = 5;

  SettingProvider() {
    init();
  }

  @override
  Future<void> fetchList({int? page, int size = FETCH_SIZE}) async {
    try {
      int fetchPage = page ?? currentPage;
      clear();
      startLoading();
      totalCount = list.length;
      print('## totalCount : $totalCount');
      stopLoading();
    } catch (e) {
      print('## fetchList() error >> ${e.toString()}');
    }
  }
}

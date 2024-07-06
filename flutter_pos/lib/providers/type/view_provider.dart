import 'package:flutter/widgets.dart';

import '../../shared/loading_status.dart';

abstract class ViewProvider extends ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus();

  notify() {
    notifyListeners();
  }

  void init();

  void startLoading() {
    loadingStatus.start();
    notify();
  }

  void stopLoading() {
    loadingStatus.done();
    notify();
  }
}
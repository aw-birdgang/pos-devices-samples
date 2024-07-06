import 'package:flutter/material.dart';
import 'package:flutter_pos/pages/game/game_page.dart';

import '../models/menu.dart';
import '../pages/setting/setting_page.dart';
import '../pages/ticket/ticket_page.dart';
import 'auth_controller.dart';

class SideMenuController extends ChangeNotifier {
  final AuthController? _authProvider;

  int currentSelectedIndex = 0;

  void onChangeSelectedMenu(index) {
    for (int i = 0; i < menuModelList.length; i++) {
      if (i == index) {
        //print(menuModelList[i].title.toString() + " selected");
        menuModelList[i].isSelected = true;
      } else {
        menuModelList[i].isSelected = false;
      }
    }
    currentSelectedIndex = index;
    notifyListeners();
  }

  final GlobalKey<ScaffoldState> getScaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> getViewOrderScaffoldKey = GlobalKey<ScaffoldState>();

  void mainControlMenu() {
    if (!getScaffoldKey.currentState!.isDrawerOpen) {
      getScaffoldKey.currentState!.openDrawer();
    }
  }

  void viewOrderControlMenu() {
    if (!getViewOrderScaffoldKey.currentState!.isDrawerOpen) {
      getViewOrderScaffoldKey.currentState!.openDrawer();
    }
  }

  SideMenuController(this._authProvider) {
    buildMenu();
  }

  final _screens = [
    const GamePage(),
    const TicketPage(),
    const SettingPage(),
  ];

  final _screens_title = [
    'GAME',
    'TICKET SCAN',
    'SETTING',
  ];

  final List<Menu> _menuModelList = [
    Menu("Games", "assets/icons/menu_task.svg"),
    Menu("Tickets", "assets/icons/menu_tran.svg"),
    Menu("Settings", "assets/icons/menu_setting.svg"),
  ];

  List<Menu> menuModelList = [];
  var screens_title = [];
  var screens = [];
  void buildMenu() {
    screens_title = _screens_title;
    menuModelList = _menuModelList;
    screens = _screens;
    notifyListeners();
  }
}
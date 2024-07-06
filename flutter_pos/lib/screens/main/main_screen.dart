import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controllers/auth_controller.dart';
import '../../controllers/sidemenu_controller.dart';
import '../../shared/constants.dart';
import 'components/header.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authprovider = Provider.of<AuthController>(context);

    return Scaffold(
      key: context.read<SideMenuController>().getScaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Header(fct: () {
                      context.read<SideMenuController>().mainControlMenu();
                    }),
                    const SizedBox(height: defaultPadding),
                    Expanded(
                      child: Container(
                        child: context.watch<SideMenuController>().screens[
                        context.watch<SideMenuController>().currentSelectedIndex
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
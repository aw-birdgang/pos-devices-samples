import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controllers/sidemenu_controller.dart';
import '../../../shared/responsive.dart';

class Header extends StatelessWidget {
  final Function fct;
  const Header({super.key, required this.fct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              fct();
            }
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EasyRichText(
                  "${context.watch<SideMenuController>().screens_title[context.watch<SideMenuController>().currentSelectedIndex]}",
                  defaultStyle: TextStyle(
                    color: Colors.green.shade300,
                    fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
      ],
    );
  }
}
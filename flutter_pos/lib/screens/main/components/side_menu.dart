import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common/env.dart';
import '../../../controllers/sidemenu_controller.dart';
import '../../../models/menu.dart';
import '../../../shared/constants.dart';
import '../../../shared/responsive.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String flavor = IS_ENV == PROD ? PROD.toUpperCase() : DEV.toUpperCase();
    String version = IS_ENV == PROD ? PROD_VERSION : DEV_VERSION;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                    children:[
                      TextSpan(
                          text: "$flavor ", style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold,
                      )),
                      TextSpan(
                          text: version , style: const TextStyle(
                        color: Colors.white54, fontWeight: FontWeight.bold,
                      )),
                    ]
                ),
              ),
            ),
          ),
          Consumer<SideMenuController>(
            builder: (context, menuController, child) => DrawerListTile(listOfModel: menuController.menuModelList),
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.listOfModel,
  });

  final List<Menu> listOfModel;

  @override
  Widget build(BuildContext context) {
    List<Widget> ListOfListTile = [];
    for (int i = 0; i < listOfModel.length; i++) {
      ListOfListTile.add(InkWell(
        hoverColor: Colors.grey.withOpacity(0.3),
        child: Container(
          color: listOfModel[i].isSelected! ? Colors.grey.withOpacity(0.3) : secondaryColor,
          child: ListTile(
            selected: true,
            selectedColor: Colors.grey.shade400,
            onTap: () async {
              context.read<SideMenuController>().onChangeSelectedMenu(i);
              if (Responsive.isMobile(context) ||
                  Responsive.isBigMobile(context) ||
                  Responsive.isTablet(context)) Navigator.pop(context);
            },
            horizontalTitleGap: 0.0,
            leading: SvgPicture.asset(
              listOfModel[i].svgSrc!,
              color: Colors.white54,
              height: 16,
            ),
            title: Text(
              listOfModel[i].title!,
              style: const TextStyle(color: Colors.white54),
            ),
          ),
        ),
      ));
    }
    return Column(
      children: [...ListOfListTile],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../components/paging_listview.dart';
import '../../../models/game.dart';
import '../../../models/setting.dart';
import '../../../providers/setting_provider.dart';
import '../../../shared/constants.dart';
import 'setting_item.dart';

class SettingDetail extends StatefulWidget {

  SettingDetail(this.settingProvider, {
    super.key
  });

  SettingProvider settingProvider;

  @override
  State<SettingDetail> createState() => _SettingDetailState();
}

class _SettingDetailState extends State<SettingDetail> {
  late SettingProvider settingProvider;

  bool status = true;

  Widget itemWidget(Setting item) {
    return SettingItem(item, key: Key("setting_${item.id}"));
  }

  @override
  Widget build(BuildContext context) {
    settingProvider = widget.settingProvider;
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
          PagingListView(settingProvider, itemWidget),
          const Divider(thickness: 2,),
        ],
      ),
    );
  }

}
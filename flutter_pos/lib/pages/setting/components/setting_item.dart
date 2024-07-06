import 'package:flutter/material.dart';

import '../../../models/setting.dart';

class SettingItem extends StatefulWidget {
  SettingItem(this.setting, {super.key});
  Setting setting;
  @override
  State<SettingItem> createState() => _SettingItemState();
}

class _SettingItemState extends State<SettingItem> {
  bool status = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white.withOpacity(0.05),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: () {
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ],
        ),
      ),
    );
  }


  Widget getTextNumber(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20),
    );
  }

}

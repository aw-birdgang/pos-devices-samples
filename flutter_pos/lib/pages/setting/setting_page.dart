import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/setting_provider.dart';
import 'components/setting_detail.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});
  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ChangeNotifierProvider<SettingProvider>(
          create: (context) => SettingProvider(),
          child: Consumer<SettingProvider>(
            builder: (context, provider, child) {
              return SettingDetail(provider);
            },
          ),
        )
    );
  }
}
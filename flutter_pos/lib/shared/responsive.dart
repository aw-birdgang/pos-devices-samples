import 'package:flutter/material.dart';

import 'utils.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      Utils.getScreenSize(context).width < 600;

  static bool isBigMobile(BuildContext context) =>
      Utils.getScreenSize(context).width > 600 &&
          Utils.getScreenSize(context).width < 800;

  static bool isTablet(BuildContext context) =>
      Utils.getScreenSize(context).width < 1100 &&
          Utils.getScreenSize(context).width >= 800;

  static bool isDesktop(BuildContext context) =>
      Utils.getScreenSize(context).width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size _size = Utils.getScreenSize(context);
    // If our width is more than 1100 then we consider it a desktop
    if (_size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (_size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
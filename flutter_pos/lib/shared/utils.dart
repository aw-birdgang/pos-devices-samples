import 'package:flutter/cupertino.dart';

class Utils {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }
}
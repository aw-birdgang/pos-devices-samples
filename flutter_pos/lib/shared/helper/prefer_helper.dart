import 'package:shared_preferences/shared_preferences.dart';

class PreferHelper {
  //
  static const String _userId = 'userId';
  static const String _password = 'password';

  //
  static Future<String> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId) ?? '';
  }
  static Future<bool> setUserId(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userId, userId);
  }

  //
  static Future<String> getPassword() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_password) ?? '';
  }
  static Future<bool> setPassword(String password) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_password, password);
  }

}
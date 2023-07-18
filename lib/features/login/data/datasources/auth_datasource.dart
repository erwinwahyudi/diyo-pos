import 'package:shared_preferences/shared_preferences.dart';

class AuthDataSource {
  static const String _isLoginKey = 'isLogin';

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final isLogin = prefs.getBool(_isLoginKey);
    return isLogin ?? false;
  }

  Future<void> setLoggedIn(bool isLogin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoginKey, isLogin);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  Future<bool> setLoginStatus(bool loginStatus) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool('login_status', loginStatus);
  }

  Future<bool> getLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(('login_status'))??false;
  }

  void clearPreferences() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
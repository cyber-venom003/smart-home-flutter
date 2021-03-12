import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_home_flutter/Services/authentication.dart';

class LocalPreferences {

  void saveLoginStatus(bool status) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('login_status', status);
  }
  
  void saveUserDetails(UserId loggedInUser) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('user_email', loggedInUser.email);
    sharedPreferences.setString('user_uid', loggedInUser.uid);
    sharedPreferences.setString('user_profilePicURL', loggedInUser.profilePicURL);
    sharedPreferences.setBool('login_status', loggedInUser.isLoggedIn);
  }

  Future<UserId> getSavedUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return UserId(
        email: sharedPreferences.getString('user_email'),
        uid: sharedPreferences.getString('user_uid'),
        profilePicURL: sharedPreferences.getString('user_profilePicURL'),
        isLoggedIn: sharedPreferences.getBool('login_status')
    );
  }

  void clearPreferences() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_flutter/Screens/authScreen.dart';
import 'package:smart_home_flutter/Services/local_preferences.dart';
import '../Services/authentication.dart';

class Dashboard extends StatelessWidget {
  Dashboard({@required this.user});
  final UserId user;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final preferences = Provider.of<LocalPreferences>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FlutterLogo(),
              Text(user.email),
              ElevatedButton(
                onPressed: (){
                  authService.signOutUser();
                  preferences.saveLoginStatus(false);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthScreen()));
                },
                child: Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_flutter/Services/local_preferences.dart';
import '../Services/authentication.dart';

class AddRooms extends StatelessWidget {
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
              Text('Add your rooms here'),
              ElevatedButton(
                onPressed: (){
                  authService.signOutUser();
                  preferences.saveLoginStatus(false);
                  Navigator.pop(context);
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

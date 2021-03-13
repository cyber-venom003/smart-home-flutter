import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_home_flutter/Screens/authScreen.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_flutter/Screens/homeScreen.dart';
import 'package:smart_home_flutter/Services/rooms.dart';
import './Services/local_preferences.dart';
import './Services/authentication.dart';
import './Services/db_crud.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<LocalPreferences>(create: (_) => LocalPreferences()),
        Provider<FireStoreDB>(create: (_) => FireStoreDB()),
        ChangeNotifierProvider<Rooms>(create: (_) => Rooms(),)
      ],
      child: SmartHome(),
    )
  );
}

class SmartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final preferences = Provider.of<LocalPreferences>(context , listen: false);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
        future: preferences.getSavedUser(),
        builder: (context , snapShot){
          if(snapShot.connectionState == ConnectionState.done){
            final user = snapShot.data;
            print(user.email);
            return user.isLoggedIn == true ? Dashboard(user: user,) : AuthScreen();
          } else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_flutter/Screens/addRooms.dart';
import 'package:smart_home_flutter/Screens/homeScreen.dart';
import 'package:smart_home_flutter/Services/db_crud.dart';
import 'package:smart_home_flutter/Services/local_preferences.dart';
import '../Services/authentication.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 15 , horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text(
                  'Control smart Devices in a smart way',
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600
                      )
                  )
              ),
              SizedBox(height: 35),
              Image.asset(
                'assets/images/smart-devices.png',
                width: 320,
                height: 320,
              ),
              SizedBox(height: 35,),
              TextButton(
                onPressed: () async {
                 final authService = Provider.of<AuthService>(context, listen: false);
                 final preferences = Provider.of<LocalPreferences>(context, listen: false);
                 final db = Provider.of<FireStoreDB>(context, listen: false);
                 try {
                   final userId = await authService.signInGoogle();
                   print(userId.email);
                   db.addDataInDB('users', userId.email , {
                     "email": userId.email,
                     "uid": userId.uid,
                   });
                   preferences.saveUserDetails(userId);
                   Navigator.push(context, MaterialPageRoute(builder: (context) => AddRooms()));
                 } catch (e) {
                   print(e);
                 }
                },
                child: Container(
                  width: 320,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFF6508DF),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sign Up with ',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                            )
                        ),
                      ),
                      Icon(FontAwesomeIcons.google , size: 25, color: Colors.white,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 50,),
              GestureDetector(
                onTap: () async {
                  final authService = Provider.of<AuthService>(context, listen: false);
                  final preferences = Provider.of<LocalPreferences>(context, listen: false);
                  try {
                    final userId = await authService.signInGoogle();
                    preferences.saveUserDetails(userId);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(user: userId,)));
                  } catch (e) {
                    print(e);
                  }
                },
                child: Text(
                  'Already connected? Login here',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF6508DF),
                      )
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

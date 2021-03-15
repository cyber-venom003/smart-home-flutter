import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_flutter/Services/local_preferences.dart';
import 'package:smart_home_flutter/Services/rooms.dart';
import '../Services/authentication.dart';

class AddRooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final preferences = Provider.of<LocalPreferences>(context, listen: false);
    final rooms = Provider.of<Rooms>(context).get();
    final addRoomInList = Provider.of<Rooms>(context, listen: false).addRoom;
    final popRoom = Provider.of<Rooms>(context, listen: false).deleteLastRoom;
    TextEditingController roomNameController = TextEditingController(text: '');
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                'Add rooms',
                textAlign: TextAlign.left,
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700
                  )
                ),
              ),
              SizedBox(height: 27,),
              Text(
                'Add rooms with names',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 19,
                    color: Color(0xFF6508DF),
                    fontWeight: FontWeight.w500
                  )
                ),
              ),
              SizedBox(height: 27,),
              TextField(
                maxLength: 25,
                textAlign: TextAlign.center,
                controller: roomNameController,
                keyboardType: TextInputType.name,
                style: TextStyle(
                  height: 1,
                  color: Color(0xFF6508DF)
                ),
                decoration: InputDecoration(
                  hintText: 'E.g. Linda\'s Bedroom',
                  hintTextDirection: TextDirection.ltr,
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Color(0xFFCBB4E9)
                  ),
                  prefixIcon: IconButton(
                    onPressed: popRoom,
                    padding: EdgeInsets.all(0),
                    iconSize: 20,
                    icon: FaIcon(FontAwesomeIcons.times , color: Color(0xFFE50303),),
                  ),
                  suffixIcon: IconButton(
                    iconSize: 20,
                    padding: EdgeInsets.all(0),
                    onPressed: (){
                      if(roomNameController.text.length != 0){
                        addRoomInList(roomNameController.text , context);
                      } else {
                        print('Enter a room name');
                      }
                      roomNameController.clear();
                    },
                    icon: FaIcon(FontAwesomeIcons.plus , color: Color(0xFF6508DF),),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                    borderSide: BorderSide(color: Color(0xFF6508DF) , width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF6508DF), width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF43009B), width: 1.5),
                    borderRadius: BorderRadius.all(Radius.circular(23)),
                  ),
                ),
              ),
              SizedBox(height: 27,),
              ...rooms
            ],
          ),
        ),
      ),
    );
  }
}

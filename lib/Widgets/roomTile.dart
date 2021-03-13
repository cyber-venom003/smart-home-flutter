import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomTile extends StatelessWidget {
  RoomTile({@required this.roomName});
  final String roomName;
  @override
  Widget build(BuildContext context) {
    return Container(
     alignment: Alignment.center,
     width: double.infinity,
     height: 55,
     decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.all(Radius.circular(15)),
       boxShadow: [
         BoxShadow(
           color: Color(0xFFBE98EF),
           offset: Offset(0 , 3),
           blurRadius: 6
         )
       ]
     ),
     child: Text(
       roomName,
       style: GoogleFonts.poppins(
           fontSize: 17.5
          ),
        )
    );
  }
}

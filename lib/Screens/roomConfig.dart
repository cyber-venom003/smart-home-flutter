import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_home_flutter/Widgets/deviceCard.dart';

class RoomConfig extends StatelessWidget {
  RoomConfig({@required this.roomName});
  final String roomName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add devices',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w700
                      )
                  ),
                ),
              ),
              SizedBox(height: 26,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Add devices in a room',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 19,
                          color: Color(0xFF6508DF),
                          fontWeight: FontWeight.w500
                      )
                  ),
                ),
              ),
              SizedBox(height: 17,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '$roomName',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 22.5,
                      )
                  ),
                ),
              ),
              SizedBox(height: 17,),
              Wrap(
                direction: Axis.horizontal,
                spacing: 30,
                runSpacing: 20,
                children: [
                  DeviceCard(deviceImage: 'smart-blub.PNG' , scale: 2 , name: 'Smart Light',),
                  DeviceCard(deviceImage: 'power-button.PNG' , scale: 7 , name: 'Toggle Devices',),
                  DeviceCard(deviceImage: 'router.PNG', scale: 4, name: 'Router',),
                  DeviceCard(deviceImage: 'speakers.PNG', scale: 5, name: 'Sound System',),
                  DeviceCard(deviceImage: 'tv.PNG', scale: 2.5, name: 'Smart TV',),
                  DeviceCard(deviceImage: 'streaming-device.png', scale: 5, name: 'Streaming Box',),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

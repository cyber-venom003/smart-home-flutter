import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeviceCard extends StatelessWidget {
  DeviceCard({@required this.deviceImage , @required this.scale , @required this.name});
  final String deviceImage;
  final double scale;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 134.0,
      height: 151.0,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(23.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6508DF).withOpacity(0.21),
            offset: Offset(0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/images/$deviceImage',
              scale: scale,
            ),
          ),
          Text(
            name,
            style: GoogleFonts.poppins(
              fontSize: 15
            ),
          )
        ],
      ),
    );
  }
}

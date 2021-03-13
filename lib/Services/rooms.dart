import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:smart_home_flutter/Widgets/roomTile.dart';

class Rooms extends ChangeNotifier {
  List<Widget> _list = [];

  List<Widget> get() => _list;

  void addRoom(String roomName){
    _list.add(
      GestureDetector(
        onTap: (){
          print(roomName);
        },
        child: RoomTile(roomName: roomName),
      )
    );
    _list.add(SizedBox(height: 27,));
    notifyListeners();
  }
  void deleteLastRoom(){
    if(_list.length > 0){
      _list.removeLast();
    }
    notifyListeners();
  }
}
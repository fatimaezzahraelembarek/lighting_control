import 'package:flutter/material.dart';
import '../../domain/entities/room.dart';

class LightingController with ChangeNotifier {
  List<Room> rooms = [
    Room(name: 'Entrance', lightLevel: 50, isOutOfOrder: false),
    Room(name: 'Office 1', lightLevel: 100, isOutOfOrder: false),
    Room(name: 'Office 2', lightLevel: 0, isOutOfOrder: false),
    Room(name: 'Supply room', lightLevel: 0, isOutOfOrder: false),
  ];

  void updateLightLevel(int index, int level) {
    if (!rooms[index].isOutOfOrder) {
      rooms[index] = Room(
        name: rooms[index].name,
        lightLevel: level,
        isOutOfOrder: rooms[index].isOutOfOrder,
      );
      notifyListeners();
    }
  }

  void turnOnAllLights() {
    for (int i = 0; i < rooms.length; i++) {
      if (!rooms[i].isOutOfOrder) {
        rooms[i] = Room(
          name: rooms[i].name,
          lightLevel: 100,
          isOutOfOrder: rooms[i].isOutOfOrder,
        );
      }
    }
    notifyListeners();
  }

  void turnOffAllLights() {
    for (int i = 0; i < rooms.length; i++) {
      if (!rooms[i].isOutOfOrder) {
        rooms[i] = Room(
          name: rooms[i].name,
          lightLevel: 0,
          isOutOfOrder: rooms[i].isOutOfOrder,
        );
      }
    }
    notifyListeners();
  }
}

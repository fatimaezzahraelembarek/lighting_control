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
      rooms[index] = rooms[index].copyWith(lightLevel: level);
      notifyListeners();
    }
  }

  void toggleOutOfOrder(int index, bool isOutOfOrder) {
    rooms[index] = rooms[index].copyWith(
      isOutOfOrder: isOutOfOrder,
      lightLevel: isOutOfOrder ? 0 : rooms[index].lightLevel, // Mettre à zéro si "Out of order"
    );
    notifyListeners(); // Notifie la Home Page pour mettre à jour l'affichage
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

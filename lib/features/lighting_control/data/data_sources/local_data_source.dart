import '../models/room_model.dart';

class LocalDataSource {
  // Simulate fetching data from local storage
  List<RoomModel> fetchRooms() {
    return [
      RoomModel(name: 'Entrance', lightLevel: 50, isOutOfOrder: false),
      RoomModel(name: 'Office 1', lightLevel: 100, isOutOfOrder: false),
      RoomModel(name: 'Office 2', lightLevel: 0, isOutOfOrder: false),
      RoomModel(name: 'Supply room', lightLevel: 0, isOutOfOrder: true),
    ];
  }
}

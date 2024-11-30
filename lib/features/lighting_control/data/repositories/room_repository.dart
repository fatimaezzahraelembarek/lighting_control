import '../models/room_model.dart';

class RoomRepository {
  // Mock data for now
  List<RoomModel> getRooms() {
    return [
      RoomModel(name: 'Entrance', lightLevel: 50, isOutOfOrder: false),
      RoomModel(name: 'Office 1', lightLevel: 100, isOutOfOrder: false),
      RoomModel(name: 'Office 2', lightLevel: 0, isOutOfOrder: false),
      RoomModel(name: 'Supply room', lightLevel: 0, isOutOfOrder: true),
    ];
  }

  // Future method to save room data (e.g., to local storage or an API)
  Future<void> saveRoom(RoomModel room) async {
    // Placeholder for saving logic
    print('Saving room: ${room.name}');
  }
}

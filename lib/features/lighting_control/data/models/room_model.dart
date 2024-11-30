class RoomModel {
  final String name;
  final int lightLevel;
  final bool isOutOfOrder;

  RoomModel({
    required this.name,
    required this.lightLevel,
    required this.isOutOfOrder,
  });

  // Factory method to convert from JSON (for APIs or local storage)
  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      name: json['name'],
      lightLevel: json['lightLevel'],
      isOutOfOrder: json['isOutOfOrder'],
    );
  }

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lightLevel': lightLevel,
      'isOutOfOrder': isOutOfOrder,
    };
  }
}

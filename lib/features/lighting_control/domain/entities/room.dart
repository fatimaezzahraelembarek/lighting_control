class Room {
  final String name;
  final int lightLevel;
  final bool isOutOfOrder;

  Room({
    required this.name,
    required this.lightLevel,
    required this.isOutOfOrder,
  });
  Room copyWith({
    String? name,
    int? lightLevel,
    bool? isOutOfOrder,
  }) {
    return Room(
      name: name ?? this.name,
      lightLevel: lightLevel ?? this.lightLevel,
      isOutOfOrder: isOutOfOrder ?? this.isOutOfOrder,
    );
  }

}

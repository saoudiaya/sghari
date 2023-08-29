class Pos {
  late String name;
  late double longitude;
  late double latitude;

  Pos({required this.name, required this.longitude, required this.latitude});
  factory Pos.fromJson(Map<String, dynamic>? json) {
    return Pos(
      name: json?['name'] as String,
      longitude: json?['longitude'] as double,
      latitude: json?['latitude'] as double,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['longitude'] = longitude;
    data['latitude'] = latitude;
    return data;
  }
}

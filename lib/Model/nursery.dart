import 'package:geolocator/geolocator.dart';

class Nursery {
    // ignore: non_constant_identifier_names
    late  String registration_number;
    late  String name;
    // ignore: non_constant_identifier_names
    late  int phone_number;
    late  String address;
    late  Position position;
    late  String email;
    late  int capacity;
    late  String description;
    late  String image;
    late  String gategory;
    late  double price;

  Nursery({
    // ignore: non_constant_identifier_names
    required this.registration_number,
    required this.name,
    // ignore: non_constant_identifier_names
    required this.phone_number,
    required this.address,
    required this.position,
    required this.email,
    required this.capacity,
    required this.description,
    required this.image,
    required this.gategory,
    required this.price,
  });
  
}
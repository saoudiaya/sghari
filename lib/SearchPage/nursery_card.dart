import 'package:flutter/material.dart';

import '../Model/position.dart';

// ignore: must_be_immutable
class NurseryCard extends StatelessWidget {
  // ignore: non_constant_identifier_names
  late String registration_number;
  late String name;
  // ignore: non_constant_identifier_names
  late int phone_number;
  late String address;
  late Pos position;
  late String email;
  late int capacity;
  late String description;
  late String image;

  NurseryCard({super.key, 
    required this.name,
    required this.address,
    required this.capacity,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(12),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    child: Image.asset(image),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.grey[500],
                      child: const Text(
                        'Full Time',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              Text(address),
            ],
          ),
        ),
      ),
    );
  }
}

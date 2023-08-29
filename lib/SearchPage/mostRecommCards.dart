// ignore: file_names
import 'package:flutter/material.dart';

import '../Model/position.dart';

// ignore: must_be_immutable
class MostRecommCards extends StatelessWidget {
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

  // ignore: use_key_in_widget_constructors
  MostRecommCards({
    required this.name,
    required this.address,
    required this.capacity,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                height: 70,
                color: Colors.grey[300],
                child: Image.asset(image),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    address,
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

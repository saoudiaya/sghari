// ignore: file_names
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewUI extends StatelessWidget {
  final String image, name, date, comment;
  final double rating;

  const ReviewUI({super.key, 
    required this.image,
    required this.name,
    required this.date,
    required this.comment,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 2.0,
        bottom: 2.0,
        left: 16.0,
        right: 0.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 30.0,
                width: 30.0,
                margin: const EdgeInsets.only(right: 16.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(44.0),
                ),
              ),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              SmoothStarRating(
                starCount: 5,
                rating: rating,
                size: 15.0,
                color: Colors.orange,
                borderColor: Colors.orange,
              ),
              const SizedBox(width: 16.0),
              Text(
                date,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            comment,
            style: const TextStyle(
              fontSize: 15.0,
              color: Color(0xFF808080),
            ),
          )
        ],
      ),
    );
  }
}

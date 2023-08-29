import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../Model/reviewModal.dart';
import '../Model/reviewUI.dart';
import 'package:intl/intl.dart';

class ReadMorePage extends StatefulWidget {
  final int index;
  const ReadMorePage(this.index, {super.key});

  @override
  State<ReadMorePage> createState() => _ReadMorePageState();
}

class _ReadMorePageState extends State<ReadMorePage> {
  
  List<double> ratings = [0.1, 0.3, 0.5, 0.7, 0.9];
  List _listnursery = [];
  @override
  void initState() {
    getNursery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 30,
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: const [
                  Text(
                    "Reviews",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: (() {
                                  double totalRating = 0.0;
                                  for (int i = 0;
                                      i <
                                          _listnursery[widget.index]['reviews']
                                              .length;
                                      i++) {
                                    totalRating += _listnursery[widget.index]
                                        ['reviews'][i]['rating'] as double;
                                  }
                                  double averageRating = totalRating /
                                      _listnursery[widget.index]['reviews']
                                          .length;
                                  return averageRating.toStringAsFixed(1);
                                }()),
                                style: const TextStyle(fontSize: 48.0),
                              ),
                              const TextSpan(
                                text: "/5",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  color: Color(0xFF808080),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SmoothStarRating(
                          starCount: 5,
                          rating: (() {
                            double totalRating = 0.0;
                            for (int i = 0;
                                i <
                                    _listnursery[widget.index]['reviews']
                                        .length;
                                i++) {
                              totalRating += _listnursery[widget.index]
                                  ['reviews'][i]['rating'] as double;
                            }
                            double averageRating = totalRating /
                                _listnursery[widget.index]['reviews'].length;
                            return averageRating;
                          }()),
                          size: 28.0,
                          color: Colors.orange,
                          borderColor: Colors.orange,
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          "${_listnursery[widget.index]['reviews'].length.toString()} Reviews",
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Color(0xFF808080),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 200.0,
                      child: ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Text(
                                "${index + 1}",
                                style: const TextStyle(fontSize: 18.0),
                              ),
                              const SizedBox(width: 4.0),
                              const Icon(Icons.star, color: Colors.orange),
                              const SizedBox(width: 8.0),
                              LinearPercentIndicator(
                                lineHeight: 6.0,
                                width: MediaQuery.of(context).size.width / 2.8,
                                animation: true,
                                animationDuration: 2500,
                                percent: ratings[index],
                                progressColor: Colors.orange,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
              itemCount: _listnursery[widget.index]['reviews'].length,
              itemBuilder: (context, index) {
                String dateStr =
                    _listnursery[widget.index]['reviews'][index]['date'];
                DateTime dateTime = DateTime.parse(dateStr);
                String formattedDate =
                    DateFormat("E MMM dd yyyy").format(dateTime);
                return ReviewUI(
                  image: _listnursery[widget.index]['reviews'][index]['image'],
                  name: _listnursery[widget.index]['reviews'][index]['name'],
                  date: formattedDate,
                  comment: _listnursery[widget.index]['reviews'][index]
                      ['comment'],
                  rating: _listnursery[widget.index]['reviews'][index]
                      ['rating'],
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 1.0,
                  color: Color.fromARGB(255, 169, 169, 169),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void getNursery() async {
    var url = "http://192.168.1.14:8087/nursery/get";
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _listnursery = data;
      });
      // ignore: avoid_print
      print(data);
    }
  }
}

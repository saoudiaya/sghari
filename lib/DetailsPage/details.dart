import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/DetailsPage/inscription.dart';
import 'package:frontend/DetailsPage/read_more.dart';

import 'package:http/http.dart' as http;

import '../Model/reviewModal.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../Model/reviewUI.dart';
import 'package:intl/intl.dart';

import 'activity.dart';

class DetailPage extends StatefulWidget {
  final int index;
  const DetailPage(this.index, {super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    _listnursery[widget.index]['image'].toString(),
                  ),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            Positioned(
              left: 20,
              top: 25,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                  const SizedBox(
                      width:
                          260), // add a 10 pixel space between the two children

                  IconButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const ActivityPage()),
                    ),
                    icon: const Icon(
                      Icons.child_care,
                      size: 40,
                    ),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 220,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _listnursery[widget.index]['name'].toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: Colors.black.withOpacity(0.8)),
                          ),
                          Text(
                            '${_listnursery[widget.index]['price'] ?? ''.toString()} TND/month',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            _listnursery[widget.index]['gategory'].toString(),
                            style: const TextStyle(
                                fontSize: 17, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.blueGrey,
                            size: 25,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            _listnursery[widget.index]['address'] ??
                                ''.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.people_alt,
                              color: Colors.blueGrey,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              _listnursery[widget.index]['capacity'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            const Icon(
                              Icons.phone,
                              color: Colors.blueGrey,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              _listnursery[widget.index]['phone_number']
                                  .toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            const Icon(
                              Icons.email,
                              color: Colors.blueGrey,
                              size: 20,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              _listnursery[widget.index]['email'].toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16.0,
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 1.0,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 0.0),
                              child: Text(
                                _listnursery[widget.index]['description']
                                    .toString(),
                                style: const TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
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
                                                    _listnursery[widget.index]
                                                            ['reviews']
                                                        .length;
                                                i++) {
                                              totalRating +=
                                                  _listnursery[widget.index]
                                                          ['reviews'][i]
                                                      ['rating'] as double;
                                            }
                                            double averageRating = totalRating /
                                                _listnursery[widget.index]
                                                        ['reviews']
                                                    .length;
                                            return averageRating
                                                .toStringAsFixed(1);
                                          }()),
                                          style:
                                              const TextStyle(fontSize: 48.0),
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
                                              _listnursery[widget.index]
                                                      ['reviews']
                                                  .length;
                                          i++) {
                                        totalRating +=
                                            _listnursery[widget.index]
                                                    ['reviews'][i]['rating']
                                                as double;
                                      }
                                      double averageRating = totalRating /
                                          _listnursery[widget.index]['reviews']
                                              .length;
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
                                          style:
                                              const TextStyle(fontSize: 18.0),
                                        ),
                                        const SizedBox(width: 4.0),
                                        const Icon(Icons.star,
                                            color: Colors.orange),
                                        const SizedBox(width: 8.0),
                                        LinearPercentIndicator(
                                          lineHeight: 6.0,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.8,
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ReadMorePage(widget.index)),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 220.0),
                          child: const Text(
                            'Read More',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          String dateStr = _listnursery[widget.index]['reviews']
                              [index]['date'];
                          DateTime dateTime = DateTime.parse(dateStr);
                          String formattedDate =
                              DateFormat("E MMM dd yyyy").format(dateTime);
                          return ReviewUI(
                            image: _listnursery[widget.index]['reviews'][index]
                                ['image'],
                            name: _listnursery[widget.index]['reviews'][index]
                                ['name'],
                            date: formattedDate,
                            comment: _listnursery[widget.index]['reviews']
                                [index]['comment'],
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
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InscriptionPage(widget.index)),
                          );
                        },
                        child: Positioned(
                          bottom: 20,
                          child: Container(
                            width: 300,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blueGrey[300],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'Pass your inscription',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Icon(
                                  Icons.navigate_next,
                                  size: 30,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
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

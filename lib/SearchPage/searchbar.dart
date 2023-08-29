import 'package:flutter/material.dart';
import 'package:frontend/DetailsPage/details.dart';
import 'package:frontend/FilterPage/filter_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Model/Filter.dart';
import 'mostRecommCards.dart';
import 'nursery_card.dart';

class SearchBar extends StatefulWidget {
  final List<String> categories;
  final RangeValues priceRange;
  final RangeValues capacityRange;

  const SearchBar({
    super.key,
    required this.categories,
    required this.priceRange,
    required this.capacityRange,
  });

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  List _listnursery = [];
  late Filter _filter = Filter();

  @override
  void initState() {
    getNursery();

    super.initState();
    _filter.getFilteredData(widget.categories, widget.priceRange,
        widget.capacityRange, _listnursery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Text('Categories: ${widget.categories}'),
          Text('Price Range: ${widget.priceRange.start} - ${widget.priceRange.end}'),
          Text('Capacity Range: ${widget.capacityRange.start} - ${widget.capacityRange.end}'),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              height: 50,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[300], // add color to BoxDecoration
              ),
              child: Image.asset(
                './assets/logo/menu.png',
                color: Colors.grey[800],
              ),
            ),
          ),*/
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Discover your nursery',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      // remove color property
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200], // set color in BoxDecoration
                    ),
                    child: Row(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          height: 40,
                          child: Image.asset('./assets/logo/search.png'),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) => updateList(value),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a nursery ...',
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FilterScreen()));
                  },
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[800],
                    ),
                    child: Image.asset('./assets/logo/filter.png'),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Most Recommended',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              itemCount: _listnursery.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                var item = _listnursery[index];
                double totalRating = 0.0;
                for (int i = 0; i < item['reviews'].length; i++) {
                  totalRating += item['reviews'][i]['rating'] as double;
                }
                double averageRating = totalRating / item['reviews'].length;
                if (averageRating > 3.0) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(index)));
                    },
                    child: NurseryCard(
                      name: item['name'],
                      address: item['address'],
                      capacity: item['price'],
                      image: item['image'],
                    ),
                  );
                } else {
                  // return an empty container if the condition is false
                  return Container();
                }
              },
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Discover More',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: ListView.builder(
              itemCount: _listnursery.length,
              itemBuilder: (context, index) {
                var item = _listnursery[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(index)));
                  },
                  child: MostRecommCards(
                    name: item['name'],
                    address: item['address'],
                    capacity: item['price'],
                    image: item['image'],
                  ),
                );
              },
            ),
          )),
        ],
      ),
    );
  }

  Future<void> updateList(String value) async {
    setState(() {
      _listnursery = _listnursery
          .where((element) =>
              element['name'].toLowerCase().contains(value.toLowerCase()) ||
              element['address'].toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
    // Navigate to the filter screen and wait for the result
  }

  void getNursery() async {
    var url = "http://192.168.1.14:8087/nursery/get";
    var response = await http.get(Uri.parse(url));
    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      setState(() {
        _listnursery = data;
        _filter = Filter();
        _filter.getFilteredData(widget.categories, widget.priceRange,
            widget.capacityRange, _listnursery);
      });
      // ignore: avoid_print
      print(data);
    }
  }
}

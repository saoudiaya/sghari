import 'package:flutter/material.dart';

import '../SearchPage/searchbar.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  List<Map> categories = [
    {"name": "Nursery", "isChecked": false},
    {"name": "Gardery", "isChecked": false},
    {"name": "Adult", "isChecked": false},
  ];
  late List<String> _categories;
  late RangeValues _priceRange;
  late RangeValues _capacityRange;

  RangeValues price = const RangeValues(70, 300);
  RangeValues capacity = const RangeValues(5, 100);

  @override
  Widget build(BuildContext context) {
    RangeLabels labelsP = RangeLabels(
      price.start.toInt().toString(),
      price.end.toInt().toString(),
    );
    RangeLabels labelsC = RangeLabels(
      capacity.start.toInt().toString(),
      capacity.end.toInt().toString(),
    );
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Category',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            ...categories.map((favorite) {
              return CheckboxListTile(
                checkboxShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(
                  favorite['name'],
                ),
                value: favorite['isChecked'],
                onChanged: (val) {
                  setState(() {
                    favorite['isChecked'] = val;
                  });
                },
              );
            }).toList(),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Price',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            RangeSlider(
              values: price,
              min: 70,
              max: 300,
              divisions: 230,
              labels: labelsP,
              onChanged: (newValues) {
                setState(() {
                  price = newValues;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${price.start.toInt()} TDN/month',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${price.end.toInt()} TDN/month',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Capacity',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
            RangeSlider(
              values: capacity,
              min: 5,
              max: 100,
              divisions: 100,
              labels: labelsC,
              onChanged: (newValues) {
                setState(() {
                  capacity = newValues;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${capacity.start.toInt()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${capacity.end.toInt()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 70, vertical: 20),
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: Colors.grey,
                  ),
                  onPressed: () {
                    _applyFilters();
                  },
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _applyFilters() {
    Map<String, dynamic> filters = {
      'priceRange': [price.start.toInt(), price.end.toInt()],
      'capacityRange': [capacity.start.toInt(), capacity.end.toInt()],
      'categories': categories
          .where((cat) => cat['isChecked'])
          .map((cat) => cat['name'])
          .toList(),
    };
    // Update the filter values
    _categories = filters['categories'].cast<String>();
    _priceRange = RangeValues(
      filters['priceRange'][0].toDouble(),
      filters['priceRange'][1].toDouble(),
    );
    _capacityRange = RangeValues(
      filters['capacityRange'][0].toDouble(),
      filters['capacityRange'][1].toDouble(),
    );
    // Pass the filter options as arguments to Navigator.pop()
    // Notify the changes
// Pass the filter options to the SearchScreen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchBar(
          categories: _categories,
          priceRange: _priceRange,
          capacityRange: _capacityRange,
        ),
      ),
    ); // Verify that the filter is applied
    // ignore: avoid_print
    print("Filters Applied:");
    // ignore: avoid_print
    print("Categories: $_categories");
    // ignore: avoid_print
    print("Price Range: $_priceRange");
    // ignore: avoid_print
    print("Capacity Range: $_capacityRange");
  }
}

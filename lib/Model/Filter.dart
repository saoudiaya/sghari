import 'package:flutter/material.dart';

class Filter {
  void getFilteredData(List<String> categories, RangeValues priceRange,
      RangeValues capacityRange, List listnursery) {
    // ignore: avoid_print
    print('list :');
    // ignore: avoid_print
    print(listnursery);

    List filteredData = List.from(listnursery);

    // filter the data based on the category
    for (var nursery in listnursery) {
      if (categories.contains(nursery['gategory'])) {
        filteredData.add(nursery);
      }
    }

    // filter the data based on price range
    filteredData = filteredData
        .where((nursery) =>
            nursery['price'] >= priceRange.start &&
            nursery['price'] <= priceRange.end)
        .toList();

    // filter the data based on capacity range
    filteredData = filteredData
        .where((nursery) =>
            nursery['capacity'] >= capacityRange.start &&
            nursery['capacity'] <= capacityRange.end)
        .toList();
        // ignore: avoid_print
    print("filter list");
    // ignore: avoid_print
    print(filteredData);
    listnursery.addAll(filteredData);
  }
}

import 'package:flutter/material.dart';
import 'package:frontend/Widgets/main_page.dart';

// ignore: import_of_legacy_library_into_null_safe
// ignore: null_safety_warnings
//ignore: deprecated_member_use

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sghari',
      /*home: SearchBar(
        categories: ['Category 1', 'Category 2'],
        priceRange: RangeValues(100, 200),
        capacityRange: RangeValues(10, 20),
      )*/
      home: MainPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

import 'package:flutter/material.dart';

import '../ChatPage/chat.dart';
import '../HomePage/home_screen.dart';
import '../NotificationPage/notification.dart';
import '../ProfilePage/profile.dart';
import '../SearchPage/searchbar.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);

  @override
  _EntryPointState createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const SearchBar(
      categories: ['Category 1', 'Category 2'],
      priceRange: RangeValues(100, 200),
      capacityRange: RangeValues(10, 20),
    ),
    const Chat(),
    NotitcationTap(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    // Set the default page to Home
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey,
        selectedItemColor: Colors.blueGrey[600],
        unselectedItemColor: Colors.blueGrey[300],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 32,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                size: 32,
              ),
              label: 'Message'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 32,
              ),
              label: 'Notification'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 32,
              ),
              label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

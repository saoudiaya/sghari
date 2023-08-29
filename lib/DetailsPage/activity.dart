import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  List data = [
    {
      'image': './assets/images/party.jpg',
      'text': 'Party Event',
      'date': '01 May 2023'
    },
    {
      'image': './assets/images/art.jpg',
      'text': 'PaintingDay',
      'date': '15 April 2023'
    },
    {
      'image': './assets/images/book.jpg',
      'text': 'Reading Day',
      'date': '07 April 2023'
    },
    {
      'image': './assets/images/charity.jpg',
      'text': 'Charity Event',
      'date': '01 April 2023'
    },
    {
      'image': './assets/images/cleaning day.jpg',
      'text': 'Cleaning Day',
      'date': '03 March 2023'
    },
    {
      'image': './assets/images/games.jpg',
      'text': 'Playing Games',
      'date': '17 February 2023'
    },
  ];
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Column(
          children: [
            Text(
              "Activity",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.black.withOpacity(0.8)),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(data[index]['image']),
                      Center(
                        child: Column(
                          children: [
                            Text(
                              data[index]['text'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                                height:
                                    10), // Add some spacing between the text and date
                            Text(
                              data[index]['date'],
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/svg.dart';

import '../LoginPage/signin_screen.dart';
import 'animated_indicator.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // ignore: unnecessary_new
  PageController pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
            child: PageView(
                controller: pageController,
                // ignore: prefer_const_constructors
                physics: NeverScrollableScrollPhysics(),
                children: [
              Slide(
                  hero: Image.asset("./assets/fonts/skip11.jpg"),
                  title: "Children,Teenager,Parents",
                  subtitle:
                      "get useful information to choose the best nursery to your child",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/fonts/skip22.png"),
                  title: "Ask,Share",
                  subtitle:
                      "Ask and Share without any hesitation. Ask questions and get an insight about your problems",
                  onNext: nextPage),
              Slide(
                  hero: Image.asset("./assets/fonts/skip33.png"),
                  title: "Reach the target",
                  subtitle:
                      "With our help, it will be easier to achieve your goals",
                  onNext: nextPage),
              // ignore: prefer_const_constructors

              // ignore: prefer_const_constructors
              SignInScreen()
            ])),
      ),
    );
  }

  void nextPage() {
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.ease);
  }
}

class Slide extends StatelessWidget {
  final Widget hero;
  final String title;
  final String subtitle;
  final VoidCallback onNext;

  const Slide(
      {Key? key,
      required this.hero,
      required this.title,
      required this.subtitle,
      required this.onNext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: hero),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  title,
                  // ignore: prefer_const_constructors
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(subtitle,
                    textAlign: TextAlign.center,
                    // ignore: prefer_const_constructors
                    style: TextStyle(fontSize: 13)),
                const SizedBox(
                  height: 35,
                ),
                ProgressButton(onNext: onNext),
              ],
            ),
          ),
          GestureDetector(
            onTap: onNext,
            // ignore: prefer_const_constructors
            child: Text("Skip",
                // ignore: prefer_const_constructors
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 4,
          )
        ],
      ),
    );
  }
}

class ProgressButton extends StatelessWidget {
  final VoidCallback onNext;
  const ProgressButton({Key? key, required this.onNext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 75,
      child: Stack(children: [
        AnimatedIndicator(
          duration: const Duration(seconds: 10),
          size: 75,
          callback: onNext,
        ),
        Center(
          child: GestureDetector(
            // ignore: sort_child_properties_last
            child: Container(
              height: 60,
              width: 60,
              // ignore: sort_child_properties_last
              child: Center(
                child: SvgPicture.asset(
                  "./assets/fonts/arrow.svg",
                  width: 10,
                ),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99), color: blue),
            ),
            onTap: onNext,
          ),
        )
      ]),
    );
  }
}

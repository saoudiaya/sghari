import 'package:flutter/material.dart';
import 'package:frontend/ProfilePage/profil_menu.dart';
import 'package:frontend/ProfilePage/profil_pic.dart';

import '../LoginPage/signin_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "./assets/logo/user.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "./assets/logo/settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "./assets/logo/question.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "./assets/logo/logout.svg",
            press: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                            const SignInScreen()),
                    );
            },
          ),
        ],
      ),
    );
  }
}

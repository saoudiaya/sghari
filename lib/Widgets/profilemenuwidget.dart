import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'animated_indicator.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.titre,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.texColor,
  });

  final String titre;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? texColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black.withOpacity(0.1),
        ),
        child: const Icon(
          LineAwesomeIcons.cog,
          size: 18.0,
          color: blue,
        ),
      ),
      title: const Text("Settings",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(
          LineAwesomeIcons.angle_right,
          size: 18.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}

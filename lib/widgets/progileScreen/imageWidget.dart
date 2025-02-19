import 'package:flutter/material.dart';

class Imagewidget extends StatelessWidget {
  const Imagewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 92,
      backgroundColor: Colors.red,
      child: CircleAvatar(
        radius: 90,
        backgroundImage: AssetImage("assets/manar.jpg"),
      ),
    );
  }
}

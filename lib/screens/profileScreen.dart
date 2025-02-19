import 'package:flutter/material.dart';
import 'package:movies_app/widgets/progileScreen/cardWidget.dart';
import 'package:movies_app/widgets/progileScreen/imageWidget.dart';

class Profilescreen extends StatelessWidget {
  const Profilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Imagewidget(),
          Text(
            "Mannar Ahmed",
            style: TextStyle(
                fontSize: 25, fontFamily: "Pacifico", color: Colors.white),
          ),
          Text(
            "Flutter Developer",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0XFF6c8090),
            ),
          ),
          Divider(
            color: Color(0XFF6c8090),
            thickness: 1,
            indent: 110,
            endIndent: 110,
          ),
          Cardwidget(
            text: '(+02) 1234567891',
          ),
          Cardwidget(
            text: 'manarahmed@gmail.com',
          ),
        ],
      ),
    );
  }
}

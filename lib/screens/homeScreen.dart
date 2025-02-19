import 'package:flutter/material.dart';
import 'package:movies_app/widgets/homeScreen/firstContainer.dart';
import 'package:movies_app/widgets/homeScreen/movieCarousel.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: RichText(
          text: const TextSpan(
            style: TextStyle(fontSize: 22.0, color: Colors.white),
            children: <TextSpan>[
              TextSpan(
                  text: 'Stream ', style: TextStyle(color: Colors.deepOrange)),
              TextSpan(
                  text: 'EveryWhere', style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FirstContainer(),
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Trending",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Expanded(
            child: MovieCarousel(),
          ),
        ],
      ),
    );
  }
}

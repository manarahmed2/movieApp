import 'package:flutter/material.dart';
import 'package:movies_app/widgets/discoverScreen/movieGrid.dart';
import 'package:movies_app/widgets/discoverScreen/searchBar.dart';

class Discoverscreen extends StatefulWidget {
  const Discoverscreen({super.key});

  @override
  State<Discoverscreen> createState() => _DiscoverscreenState();
}

class _DiscoverscreenState extends State<Discoverscreen> {
  final List<String> categories = [
    "Movies",
    "Tv Series",
    "Documentary",
    "Sports"
  ];
  String selectedCategory = "Movies";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 36, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Movies, Tv series,",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            Text(
              "and more..",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Searchbar(),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories.map((category) {
                bool isSelected = selectedCategory == category;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.red : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 32),
            Expanded(child: Moviegrid()),
          ],
        ),
      ),
    );
  }
}

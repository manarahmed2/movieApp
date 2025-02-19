import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Padding(
            padding: EdgeInsets.only(right: 20, top: 20),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Sherlock Holmes',
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
            ),
          );
  }
}
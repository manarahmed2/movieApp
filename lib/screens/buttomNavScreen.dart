import 'package:flutter/material.dart';
import 'package:movies_app/screens/discoverScreen.dart';
import 'package:movies_app/screens/homeScreen.dart';
import 'package:movies_app/screens/profileScreen.dart';

class Buttomnavscreen extends StatefulWidget {
  const Buttomnavscreen({super.key});

  @override
  State<Buttomnavscreen> createState() => _ButtomnavscreenState();
}

class _ButtomnavscreenState extends State<Buttomnavscreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [Homescreen(), Discoverscreen(), Profilescreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: const Color.fromARGB(255, 235, 53, 53),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.play_circle,
              ),
              label: 'Movies'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

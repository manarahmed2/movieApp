import 'package:flutter/material.dart';

class Cardwidget extends StatelessWidget {
  const Cardwidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: BorderSide(color: Colors.red, width: 1),
      ),
      child: ListTile(
        leading: Icon(
          Icons.phone,
          color: Colors.white,
        ),
        title: Text(
          text,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
//(+02) 1234567891
//manoraahmed12345@gmail.com

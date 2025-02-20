import 'package:flutter/material.dart';

class Similarcard extends StatelessWidget {
  const Similarcard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100, // تحديد عرض العنصر
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // يجعل العمود يأخذ أقل مساحة ممكنة
        children: [
          Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                image: AssetImage("assets/image1.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            // استخدام Flexible بدلاً من Expanded
            child: Text(
              "Star Wars:\nRise of Skywalker\n(2019)",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

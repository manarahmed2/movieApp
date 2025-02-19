import 'package:flutter/material.dart';
import 'package:movies_app/widgets/discoverScreen/movieCard.dart';

class Moviegrid extends StatelessWidget {
  const Moviegrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 10, // المسافة بين الأعمدة
          mainAxisSpacing: 10, // المسافة بين الصفوف
          childAspectRatio: 0.7, // نسبة عرض إلى ارتفاع الكارد
        ),
        itemBuilder: (context, index) {
          return MovieCard();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/widgets/details/similarCard.dart';

class SimilarMovieList extends StatelessWidget {
  const SimilarMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // زيادة الارتفاع لتجنب أي مشاكل في overflow
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) =>
            SizedBox(width: 15), // المسافة بين الكروت
        itemBuilder: (context, index) {
          return Similarcard();
        },
      ),
    );
  }
}

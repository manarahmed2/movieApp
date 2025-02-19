import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/trending/trendingCubit.dart';
import 'package:movies_app/manager/trending/trendingState.dart';
import 'package:movies_app/widgets/homeScreen/trendingMovieCard.dart';

class MovieCarousel extends StatelessWidget {
  const MovieCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Trendingcubit, Trendingstate>(builder: (context, state) {
      if (state is LoadedState) {
        return CarouselSlider(
          options: CarouselOptions(
            height: 270,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.easeInOut,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
            viewportFraction: 0.75,
          ),
          items: state.x.map((movie) {
            return TrendingMovieCard(trendingMoviesModel: movie);
          }).toList(), // تحويل القائمة إلى `List<Widget>`
        );
      } else if (state is errorState) {
        return Center(child: Text(state.message));
      } else {
        return Center(
            child: CircularProgressIndicator(
                  color: Colors.red,
                ));
      }
    });
  }
}



// CarouselSlider(
//       options: CarouselOptions(
//         height: 270, // ارتفاع السلايدر
//         enlargeCenterPage: true, // تكبير العنصر الأوسط
//         autoPlay: true, // تشغيل تلقائي
//         aspectRatio: 16 / 9,
//         autoPlayCurve: Curves.easeInOut,
//         enableInfiniteScroll: true,
//         autoPlayAnimationDuration: const Duration(milliseconds: 500),
//         viewportFraction: 0.75, // نسبة حجم العنصر مقارنة بالعرض
//       ),
//       items: [
//         const TrendingMovieCard(),
//         const TrendingMovieCard(),
//         const TrendingMovieCard(),
//       ],
//     )
import 'package:movies_app/models/similar.dart';

class DetailsModel {
  final String name;
  final String overView;
  final String date;
  final String rate;
  final String image;
  final List<SimilarMovieModel> similarMovies; // ✅ أضفنا قائمة للأفلام المشابهة

  DetailsModel({
    required this.name,
    required this.overView,
    required this.date,
    required this.rate,
    required this.image,
    required this.similarMovies,
  });
}

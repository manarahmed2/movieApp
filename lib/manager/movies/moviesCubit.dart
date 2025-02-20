import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Network/apiService.dart';
import 'package:movies_app/manager/movies/moviesState.dart';
import 'package:movies_app/models/movieModel.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());
  final Apiservice apiService = Apiservice();

  String category = "movie"; // التصنيف الافتراضي

  void setCategory(String newCategory) {
    if (category != newCategory) {
      category = newCategory;
      fetchMovies();
    }
  }

  Future<void> fetchMovies() async {
    emit(MoviesLoading());
    try {
      var json = await apiService.getTrending(
        endPoint:
            "$category/popular?api_key=c217c2ceb96deb7de1b913eee12d55c8&language=en-US",
      );

      if (json["results"] == null || json["results"] is! List) {
        throw Exception("No $category found in API response");
      }

      List<MovieModel> movies = [];
      for (var i in json["results"]) {
        movies.add(MovieModel.fromJson(i, category));
      }

      emit(MoviesLoaded(movies: movies));
    } catch (e) {
      emit(MoviesError(message: e.toString()));
    }
  }
}

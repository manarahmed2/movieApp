import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Network/apiService.dart';
import 'package:movies_app/manager/movies/moviesState.dart';
import 'package:movies_app/models/movieModel.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(MoviesInitial());
  final Apiservice apiService = Apiservice();

  Future<void> fetchMovies() async {
    emit(MoviesLoading());
    try {
      var json = await apiService.getTrending(
        endPoint:
            "movie/popular?api_key=c217c2ceb96deb7de1b913eee12d55c8&language=en-US",
      );

      // ✅ التحقق من `results` قبل التكرار
      if (json["results"] == null || json["results"] is! List) {
        throw Exception("No movies found in API response");
      }

      List<MovieModel> movies = [];
     for (var i in json["results"]) {
  movies.add(MovieModel(
    media_type: i['media_type'] ?? "Unknown",
    title: i["original_title"] ?? "No Title",
    image: i["poster_path"] ?? "No Image",
    date: i["release_date"] ?? "No Date",
    rate: (i['vote_average'] ?? 0.0).toString(), // ✅ تحويل `double` إلى `String`
  ));
}

      emit(MoviesLoaded(movies: movies));
    } catch (e) {
      emit(MoviesError(message: e.toString()));
    }
  }
}

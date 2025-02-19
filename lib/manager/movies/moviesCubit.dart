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

      List<MovieModel> movies = [];
      for (var i in json["movies"]) {
        movies.add(MovieModel(
          media_type: i['media_type'],
          title: i["title"],
          image: i['poster_path'],
          date: i['date'],
          rate: i['vote_average'],
        ));
      }

      emit(MoviesLoaded(movies: movies));
    } catch (e) {
      emit(MoviesError(message: e.toString()));
    }
  }
}

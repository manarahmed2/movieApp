import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Network/apiService.dart';

import 'package:movies_app/manager/similar/similarState.dart';
import 'package:movies_app/models/similar.dart';

class SimilarMoviesCubit extends Cubit<SimilarMoviesState> {
  SimilarMoviesCubit() : super(SimilarMoviesInitial());

  final Apiservice apiService = Apiservice();

  Future<void> getSimilarMovies(int movieId) async {
    emit(SimilarMoviesLoading());
    try {
      var json = await apiService.getTrending(
        endPoint:
            "movie/$movieId/similar?api_key=c217c2ceb96deb7de1b913eee12d55c8&language=en-US",
      );

      if (json == null || json["results"] == null || json["results"].isEmpty) {
        throw Exception("No similar movies found");
      }

      List<SimilarMovieModel> similarMovies =
          json["results"].map<SimilarMovieModel>((item) {
        return SimilarMovieModel(
          name: item["title"] ?? "Unknown",
          image: "https://image.tmdb.org/t/p/w500${item["poster_path"]}",
          date: item["release_date"] ?? "No date",
        );
      }).toList();

      emit(SimilarMoviesLoaded(movies: similarMovies));
    } catch (e) {
      emit(SimilarMoviesError(message: e.toString()));
    }
  }
}
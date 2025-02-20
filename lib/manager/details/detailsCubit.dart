import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Network/apiService.dart';
import 'package:movies_app/manager/details/detailsState.dart';
import 'package:movies_app/models/datailsaModel.dart';

import 'package:movies_app/models/similar.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());
  final Apiservice apiService = Apiservice();

  Future<void> getMovieDetails(int movieId) async {
    emit(MovieDetailsLoading());
    try {
      var json = await apiService.getTrending(
        endPoint:
            "movie/$movieId?api_key=c217c2ceb96deb7de1b913eee12d55c8&language=en-US&append_to_response=similar",
      );

      if (json == null || json.isEmpty) {
        throw Exception("Movie details not found");
      }

      List<SimilarMovieModel> similarMovies = [];
      if (json["similar"] != null && json["similar"]["results"] is List) {
        for (var item in json["similar"]["results"]) {
          similarMovies.add(SimilarMovieModel(
            name: item["original_title"] ?? "Unknown",
            image: "https://image.tmdb.org/t/p/w500${item["poster_path"]}",
            date: item["release_date"] ?? "No date",
          ));
        }
      }

      DetailsModel movie = DetailsModel(
        name: json["original_title"] ?? "Unknown",
        overView: json["overview"] ?? "No overview available",
        date: json["release_date"] ?? "No date",
        rate: json["vote_average"].toString(),
        image: "https://image.tmdb.org/t/p/w500${json["poster_path"]}",
        similarMovies: similarMovies, // تم تمرير الأفلام المشابهة
      );

      emit(MovieDetailsLoaded(movie: movie));
    } catch (e) {
      emit(MovieDetailsError(message: e.toString()));
    }
  }
}

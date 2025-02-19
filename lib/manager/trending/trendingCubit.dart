import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/Network/apiService.dart';
import 'package:movies_app/manager/trending/trendingState.dart';
import 'package:movies_app/models/trendingModel.dart';

class Trendingcubit extends Cubit<Trendingstate> {
  Trendingcubit() : super(InitialState());
  Apiservice apiservice = Apiservice();

  getTrendingMovies() async {
    emit(IsLoadingState());
    try {
      var json = await apiservice.getTrending(
          endPoint:
              "trending/movie/day?api_key=c217c2ceb96deb7de1b913eee12d55c8&language=en-US");

      List<TrendingMoviesModel> movies = [];
      for (var i in json['results']) {
        movies.add(TrendingMoviesModel(
          title: i['title'] ?? "Unknown Title",
          image: i['poster_path'] ?? "",
          rate:
              (i['vote_average'] as num?)?.toDouble() ?? 0.0, 
        ));
      }
      emit(LoadedState(x: movies));
    } on Exception catch (e) {
      emit(errorState(message: e.toString()));
      // TODO
    }
  }
}

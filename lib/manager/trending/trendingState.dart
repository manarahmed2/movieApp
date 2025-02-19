import 'package:movies_app/models/trendingModel.dart';

abstract class Trendingstate {}

class InitialState extends Trendingstate {}

class LoadedState extends Trendingstate {
  List<TrendingMoviesModel> x;
  LoadedState({required this.x});
}
class errorState extends Trendingstate{
  String message;
  errorState({required this.message});
}
class IsLoadingState extends Trendingstate{}

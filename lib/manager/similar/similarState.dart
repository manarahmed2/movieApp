import 'package:movies_app/models/similar.dart';

abstract class SimilarMoviesState {}

class SimilarMoviesInitial extends SimilarMoviesState {}

class SimilarMoviesLoading extends SimilarMoviesState {}

class SimilarMoviesLoaded extends SimilarMoviesState {
  final List<SimilarMovieModel> movies;

  SimilarMoviesLoaded({required this.movies});
}

class SimilarMoviesError extends SimilarMoviesState {
  final String message;

  SimilarMoviesError({required this.message});
}

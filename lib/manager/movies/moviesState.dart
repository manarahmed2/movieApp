import 'package:movies_app/models/movieModel.dart';

abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class MoviesLoading extends MoviesState {}

class MoviesLoaded extends MoviesState {
  final List<MovieModel> movies;

  MoviesLoaded({required this.movies});
}

class MoviesError extends MoviesState {
  final String message;

  MoviesError({required this.message});
}

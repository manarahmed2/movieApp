import 'package:movies_app/models/datailsaModel.dart';

abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoading extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final DetailsModel movie;

  MovieDetailsLoaded({required this.movie});
}

class MovieDetailsError extends MovieDetailsState {
  final String message;

  MovieDetailsError({required this.message});
}
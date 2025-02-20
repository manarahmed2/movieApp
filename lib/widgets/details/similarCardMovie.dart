import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/similar/similarCubit.dart';
import 'package:movies_app/manager/similar/similarState.dart';
import 'package:movies_app/widgets/details/similarCard.dart';


class SimilarMovieList extends StatelessWidget {
  final int movieId;

  const SimilarMovieList({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarMoviesCubit()..getSimilarMovies(movieId), // ✅ تحميل الأفلام عند بناء الواجهة
      child: BlocBuilder<SimilarMoviesCubit, SimilarMoviesState>(
        builder: (context, state) {
          if (state is SimilarMoviesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SimilarMoviesLoaded) {
            if (state.movies.isEmpty) {
              return const Center(
                child: Text(
                  "No similar movies found",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }

            return SizedBox(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.movies.length,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (context, index) {
                  final movie = state.movies[index];
                  return SimilarCard(
                    imageUrl: movie.image,
                    title: movie.name,
                    year: movie.date.split("-")[0],
                  );
                },
              ),
            );
          } else if (state is SimilarMoviesError) {
            return Center(
              child: Text(
                "Error: ${state.message}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const Center(
              child: Text(
                "Something went wrong",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    );
  }
}
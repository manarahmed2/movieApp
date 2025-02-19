import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/movies/moviesCubit.dart';
import 'package:movies_app/manager/movies/moviesState.dart';
import 'package:movies_app/widgets/discoverScreen/movieCard.dart';

class MovieGrid extends StatelessWidget {
  const MovieGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoading) {
          return const Center(child: CircularProgressIndicator(color: Colors.red));
        } else if (state is MoviesError) {
          return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
        } else if (state is MoviesLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.movies.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                return MovieCard(movie: state.movies[index]);
              },
            ),
          );
        }
        return const Center(child: Text("No data available"));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/details/detailsCubit.dart';
import 'package:movies_app/manager/details/detailsState.dart';
import 'package:movies_app/widgets/details/similarCardMovie.dart';

class DetailsScreen extends StatelessWidget {
  final int movieId;
  final String mediaType;
  const DetailsScreen({super.key, required this.movieId, required this.mediaType});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit()
        ..getMovieDetails(movieId,mediaType), // ✅ تحميل بيانات الفيلم عند فتح الشاشة
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<MovieDetailsCubit, MovieDetailsState>(
          builder: (context, state) {
            if (state is MovieDetailsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is MovieDetailsLoaded) {
              final movie = state.movie;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            movie.image.isNotEmpty
                                ? movie.image
                                : "https://via.placeholder.com/500x300", // ✅ صورة افتراضية عند عدم توفر صورة الفيلم
                            width: double.infinity,
                            height: 300,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 40,
                          left: 10,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.white, size: 30),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  movie.name,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.grey[800],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  '4K',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(Icons.access_time,
                                  color: Colors.white70, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                movie.date,
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                              const SizedBox(width: 20),
                              const Icon(Icons.star,
                                  color: Colors.amber, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                '${movie.rate} (IMDb)',
                                style: const TextStyle(
                                    color: Colors.white70, fontSize: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Synopsis',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            movie.overView,
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 14),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Related Movies',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          SimilarMovieList(
                              movieId: movieId), // ✅ تمرير movieId هنا
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is MovieDetailsError) {
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
      ),
    );
  }
}

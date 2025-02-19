import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/movies/moviesCubit.dart';
import 'package:movies_app/widgets/discoverScreen/movieGrid.dart';
import 'package:movies_app/widgets/discoverScreen/searchBar.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<String> categories = ["Movies", "Tv Series", "Documentary", "Sports"];
  String selectedCategory = "Movies";

  @override
  void initState() {
    super.initState();
    context.read<MoviesCubit>().fetchMovies(); // ✅ استدعاء جلب الأفلام عند فتح الصفحة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 36, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Find Movies, Tv series,",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const Text(
              "and more..",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            const Searchbar(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: categories.map((category) {
                bool isSelected = selectedCategory == category;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Text(
                    category,
                    style: TextStyle(
                      color: isSelected ? Colors.red : Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 32),
            Expanded(child: MovieGrid()), // ✅ عرض الأفلام في MovieGrid
          ],
        ),
      ),
    );
  }
}

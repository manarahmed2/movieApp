import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/manager/trending/trendingCubit.dart';
import 'package:movies_app/screens/buttomNavScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: Buttomnavscreen(),
        ),
        create: (context) => Trendingcubit()..getTrendingMovies());
  }
}

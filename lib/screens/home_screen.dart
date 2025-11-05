/// Course: F2025 MAD201-01 Cross Platform Mobile Apps
/// Assignment 3 – Movie Explorer App
/// Author: Nithin Amin (A00194432)
/// Description: Home screen: list of movies with navigation to detail.

import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final List<Movie> movies;
  final void Function(Movie) onToggleFavorite;

  const HomeScreen({super.key, required this.movies, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return MovieCard(
          movie: movie,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MovieDetailScreen(movie: movie, onToggleFavorite: onToggleFavorite)),
            );
          },
          onToggleFavorite: () => onToggleFavorite(movie),
        );
      },
    );
  }
}

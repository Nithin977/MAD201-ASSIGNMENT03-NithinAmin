/// Course: F2025 MAD201-01 Cross Platform Mobile Apps
/// Assignment 3 – Movie Explorer App
/// Author: Nithin Amin (A00194432)
/// Description: Favorites screen: shows only favorite movies.

import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/movie_card.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Movie> movies;
  final void Function(Movie) onToggleFavorite;

  const FavoritesScreen({super.key, required this.movies, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    if (movies.isEmpty) {
      return const Center(child: Text('No favorites yet. Tap the heart to add some!'));
    }
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

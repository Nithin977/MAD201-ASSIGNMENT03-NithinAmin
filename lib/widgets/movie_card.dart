/// Course: F2025 MAD201-01 Cross Platform Mobile Apps
/// Assignment 3 – Movie Explorer App
/// Author: Nithin Amin (A00194432)
/// Description: Reusable movie tile/card widget for lists.

import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;
  final VoidCallback onToggleFavorite;

  const MovieCard({super.key, required this.movie, required this.onTap, required this.onToggleFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(movie.imagePath, width: 56, height: 56, fit: BoxFit.cover),
        ),
        title: Text(movie.title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('${movie.genre} • ${movie.year}'),
        trailing: IconButton(
          icon: Icon(movie.isFavorite ? Icons.favorite : Icons.favorite_border),
          onPressed: onToggleFavorite,
        ),
        onTap: onTap,
      ),
    );
  }
}

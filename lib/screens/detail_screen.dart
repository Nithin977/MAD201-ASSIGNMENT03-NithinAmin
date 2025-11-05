/// Course: F2025 MAD201-01 Cross Platform Mobile Apps
/// Assignment 3 – Movie Explorer App
/// Author: Nithin Amin (A00194432)
/// Description: Detail screen: large poster, info, toggle favorite.

import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatefulWidget {
  final Movie movie;
  final void Function(Movie) onToggleFavorite;

  const MovieDetailScreen({super.key, required this.movie, required this.onToggleFavorite});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final m = widget.movie;
    return Scaffold(
      appBar: AppBar(title: Text(m.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(m.imagePath, height: 260, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(m.title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            Text('${m.genre} • ${m.year}', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 12),
            Text(m.description),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                setState(() {
                  m.isFavorite = !m.isFavorite;
                });
                widget.onToggleFavorite(m);
              },
              icon: Icon(m.isFavorite ? Icons.favorite : Icons.favorite_border),
              label: Text(m.isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}

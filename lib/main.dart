/// Course: F2025 MAD201-01 Cross Platform Mobile Apps
/// Assignment 3 – Movie Explorer App
/// Author: Nithin Amin (A00194432)
/// Description: App entry point with BottomNavigationBar and Drawer.

import 'package:flutter/material.dart';
import 'models/movie.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/about_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  runApp(const MovieExplorerApp());
}

class MovieExplorerApp extends StatelessWidget {
  const MovieExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Explorer',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const RootShell(),
    );
  }
}

class RootShell extends StatefulWidget {
  const RootShell({super.key});
  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  int _index = 0;

  // Shared source of truth for movies so favorite state is consistent across tabs.
  final List<Movie> _movies = demoMovies.toList();

  void _toggleFavorite(Movie movie) {
    setState(() {
      movie.isFavorite = !movie.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(movies: _movies, onToggleFavorite: _toggleFavorite),
      FavoritesScreen(
        movies: _movies.where((m) => m.isFavorite).toList(),
        onToggleFavorite: _toggleFavorite,
      ),
      const ProfileScreen(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Movie Explorer')),
      drawer: _AppDrawer(
        onNavigate: (route) {
          Navigator.pop(context);
          if (route == 'home') {
            setState(() => _index = 0);
          } else if (route == 'about') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutScreen()),
            );
          } else if (route == 'contact') {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ContactScreen()),
            );
          }
        },
      ),
      body: pages[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) => setState(() => _index = i),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.movie_outlined),
            selectedIcon: Icon(Icons.movie),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class _AppDrawer extends StatelessWidget {
  final void Function(String route) onNavigate;
  const _AppDrawer({required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 28, child: Icon(Icons.movie)),
                  SizedBox(height: 12),
                  Text(
                    'Movie Explorer',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('Nithin Amin – A00194432'),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () => onNavigate('home'),
            ),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => onNavigate('about'),
            ),
            ListTile(
              leading: const Icon(Icons.mail_outline),
              title: const Text('Contact Us'),
              onTap: () => onNavigate('contact'),
            ),
          ],
        ),
      ),
    );
  }
}

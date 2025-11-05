/// Course: F2025 MAD201-01 Cross Platform Mobile Apps
/// Assignment 3 – Movie Explorer App
/// Author: Nithin Amin (A00194432)
/// Description: Movie data model and demo seed list.
library;

class Movie {
  final String title;
  final String genre;
  final int year;
  final String description;
  final String imagePath;
  bool isFavorite;

  Movie({
    required this.title,
    required this.genre,
    required this.year,
    required this.description,
    required this.imagePath,
    this.isFavorite = false,
  });
}

/// Simple demo dataset (6 movies). Replace images with real posters if desired.
final List<Movie> demoMovies = [
  Movie(
    title: 'Interstellar',
    genre: 'Sci‑Fi',
    year: 2014,
    description:
        'A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.',
    imagePath: 'assets/posters/interstellar.png',
  ),
  Movie(
    title: 'Inception',
    genre: 'Sci‑Fi/Thriller',
    year: 2010,
    description:
        'A thief who steals corporate secrets through dream-sharing technology is given the inverse task of planting an idea.',
    imagePath: 'assets/posters/inception.png',
  ),
  Movie(
    title: 'The Dark Knight',
    genre: 'Action/Crime',
    year: 2008,
    description:
        'Batman faces the Joker, a criminal mastermind who plunges Gotham into chaos.',
    imagePath: 'assets/posters/dark_knight.png',
  ),
  Movie(
    title: 'La La Land',
    genre: 'Musical/Romance',
    year: 2016,
    description: 'A jazz pianist falls for an aspiring actress in Los Angeles.',
    imagePath: 'assets/posters/lalaland.png',
  ),
  Movie(
    title: 'Coco',
    genre: 'Animation/Family',
    year: 2017,
    description:
        'Aspiring musician Miguel enters the Land of the Dead to uncover his family\'s history.',
    imagePath: 'assets/posters/coco.png',
  ),
  Movie(
    title: 'KGF',
    genre: 'Action',
    year: 2018,
    description:
        'Rocky, a young man, seeks power and wealth in order to fulfil a promise to his dying mother. His quest takes him to Mumbai, where he becomes involved with the notorious gold mafia.',
    imagePath: 'assets/posters/kgf-2.png',
  ),
];

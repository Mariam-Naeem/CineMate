import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';
import '../../data/models/movie.dart';
import 'movie_image.dart';

class FeaturedMovieCard extends StatelessWidget {
  const FeaturedMovieCard({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.95,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: Stack(
          fit: StackFit.expand,
          children: [
            MovieImage(url: movie.imageUrl),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: .82),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 14,
              right: 14,
              bottom: 13,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: CinemateColors.accent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Featured',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  MovieMeta(movie: movie),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MovieMeta extends StatelessWidget {
  const MovieMeta({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: CinemateColors.accent, size: 12),
        const SizedBox(width: 3),
        Text(
          movie.rating,
          style: const TextStyle(color: Colors.white, fontSize: 10),
        ),
        const SizedBox(width: 10),
        Text(
          movie.year,
          style: const TextStyle(color: Colors.white70, fontSize: 10),
        ),
        const SizedBox(width: 10),
        Text(
          movie.duration ?? '',
          style: const TextStyle(color: Colors.white70, fontSize: 10),
        ),
      ],
    );
  }
}

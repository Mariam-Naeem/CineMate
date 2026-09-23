import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';
import '../../data/models/movie.dart';
import 'movie_image.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.movie, super.key});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 106,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: SizedBox(
              width: 106,
              height: 142,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  MovieImage(url: movie.imageUrl),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 46,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: .78),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 8,
                    bottom: 7,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: CinemateColors.accent,
                          size: 11,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          movie.rating,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 9,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: CinemateColors.text,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            movie.year,
            style: const TextStyle(color: CinemateColors.muted, fontSize: 9),
          ),
        ],
      ),
    );
  }
}

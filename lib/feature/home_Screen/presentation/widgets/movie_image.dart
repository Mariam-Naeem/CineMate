import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => Container(
        color: CinemateColors.field,
        child: const Icon(
          Icons.movie_outlined,
          color: CinemateColors.muted,
          size: 28,
        ),
      ),
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return Container(
          color: CinemateColors.field,
          child: const Center(
            child: CircularProgressIndicator(
              color: CinemateColors.accent,
              strokeWidth: 2,
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class CinemateLogo extends StatelessWidget {
  const CinemateLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: CinemateColors.accent,
          borderRadius: BorderRadius.circular(11),
        ),
        child: const Icon(
          Icons.movie_filter_outlined,
          color: Color(0xFF633E00),
          size: 27,
        ),
      ),
    );
  }
}

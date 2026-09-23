import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class EmptyTab extends StatelessWidget {
  const EmptyTab({required this.icon, required this.title, super.key});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: CinemateColors.accent, size: 32),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(color: CinemateColors.text, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

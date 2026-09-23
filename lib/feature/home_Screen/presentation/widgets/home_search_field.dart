import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({required this.onChanged, super.key});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      style: const TextStyle(color: CinemateColors.text, fontSize: 12),
      decoration: InputDecoration(
        hintText: 'Search movies, series...',
        hintStyle: const TextStyle(color: CinemateColors.muted, fontSize: 11),
        prefixIcon: const Icon(
          Icons.search,
          size: 18,
          color: CinemateColors.muted,
        ),
        filled: true,
        fillColor: CinemateColors.field,
        contentPadding: const EdgeInsets.symmetric(vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

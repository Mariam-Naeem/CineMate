import 'package:flutter/material.dart';

abstract final class CinemateColors {
  static const background = Color(0xFF080808);
  static const field = Color(0xFF1A1A1A);
  static const border = Color(0xFF2A2A2A);
  static const text = Color(0xFFF7F4EF);
  static const muted = Color(0xFF858585);
  static const accent = Color(0xFFFFAA16);
}

abstract final class CinemateTheme {
  static ThemeData get dark {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: CinemateColors.background,
      fontFamily: 'Roboto',
      colorScheme: ColorScheme.fromSeed(
        seedColor: CinemateColors.accent,
        brightness: Brightness.dark,
      ),
    );
  }
}

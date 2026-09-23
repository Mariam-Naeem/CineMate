import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.label,
    required this.hint,
    required this.icon,
    this.suffixIcon,
    this.controller,
    this.keyboardType,
    super.key,
  });

  final String label;
  final String hint;
  final IconData icon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: CinemateColors.muted,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 42,
          child: TextField(
            controller: controller,
            keyboardType: keyboardType,
            obscureText: suffixIcon != null,
            style: const TextStyle(color: CinemateColors.text, fontSize: 11),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: CinemateColors.muted,
                fontSize: 10,
              ),
              prefixIcon: Icon(icon, color: CinemateColors.muted, size: 15),
              suffixIcon: suffixIcon == null
                  ? null
                  : Icon(suffixIcon, color: CinemateColors.muted, size: 15),
              filled: true,
              fillColor: CinemateColors.field,
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: CinemateColors.border),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: CinemateColors.accent),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

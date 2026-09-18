import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class AuthSocialButton extends StatelessWidget {
  const AuthSocialButton({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: Icon(icon, size: 16),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: CinemateColors.text,
        backgroundColor: CinemateColors.field,
        side: const BorderSide(color: CinemateColors.border),
        minimumSize: const Size.fromHeight(38),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
        textStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
      ),
    );
  }
}

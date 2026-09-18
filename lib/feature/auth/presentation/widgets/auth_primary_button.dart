import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: FilledButton(
        onPressed: () {},
        style: FilledButton.styleFrom(
          backgroundColor: CinemateColors.accent,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
        ),
        child: Text(label),
      ),
    );
  }
}

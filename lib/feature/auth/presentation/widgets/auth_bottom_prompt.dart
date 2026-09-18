import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class AuthBottomPrompt extends StatelessWidget {
  const AuthBottomPrompt({
    required this.prefix,
    required this.action,
    super.key,
  });

  final String prefix;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: prefix,
          style: const TextStyle(color: CinemateColors.muted, fontSize: 10),
          children: [
            TextSpan(
              text: action,
              style: const TextStyle(
                color: CinemateColors.accent,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

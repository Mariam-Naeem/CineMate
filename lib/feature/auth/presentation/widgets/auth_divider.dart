import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: CinemateColors.border)),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'or continue with',
            style: TextStyle(color: CinemateColors.muted, fontSize: 9),
          ),
        ),
        const Expanded(child: Divider(color: CinemateColors.border)),
      ],
    );
  }
}

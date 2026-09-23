import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good evening,',
                style: TextStyle(color: CinemateColors.muted, fontSize: 11),
              ),
              SizedBox(height: 3),
              Text(
                'Alex Johnson 👋',
                style: TextStyle(
                  color: CinemateColors.text,
                  fontSize: 19,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 38,
          height: 38,
          decoration: const BoxDecoration(
            color: CinemateColors.field,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, size: 20),
            color: CinemateColors.text,
            padding: EdgeInsets.zero,
          ),
        ),
      ],
    );
  }
}

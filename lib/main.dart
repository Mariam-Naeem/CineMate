import 'package:flutter/material.dart';

import 'core/theme/cinemate_theme.dart';
import 'feature/auth/presentation/screens/sign_in_screen.dart';

export 'feature/auth/presentation/screens/create_account_screen.dart';
export 'feature/auth/presentation/screens/sign_in_screen.dart';

void main() {
  runApp(const CinemateApp());
}

class CinemateApp extends StatelessWidget {
  const CinemateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinemate',
      debugShowCheckedModeBanner: false,
      theme: CinemateTheme.dark,
      home: const SignInScreen(),
    );
  }
}

class MyApp extends CinemateApp {
  const MyApp({super.key});
}

import 'package:flutter/material.dart';

import 'core/di/service_locaor.dart';
import 'core/theme/cinemate_theme.dart';
import 'feature/auth/presentation/ui/screens/sign_in_screen.dart';

export 'feature/auth/presentation/ui/screens/create_account_screen.dart';
export 'feature/auth/presentation/ui/screens/sign_in_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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

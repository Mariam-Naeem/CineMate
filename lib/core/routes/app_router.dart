import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinemate/core/di/service_locaor.dart';
import 'package:cinemate/core/routes/app_routes.dart';
import 'package:cinemate/feature/auth/presentation/cubit/register_cubit.dart';
import 'package:cinemate/feature/auth/presentation/ui/screens/create_account_screen.dart';
import 'package:cinemate/feature/home_Screen/presentation/views/home_screen.dart';

class AppRouter {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<RegisterCubit>(),
            child: const CreateAccountScreen(),
          ),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return null;
    }
  }
}

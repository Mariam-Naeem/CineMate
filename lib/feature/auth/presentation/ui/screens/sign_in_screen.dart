import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locaor.dart';
import '../../../../../core/theme/cinemate_theme.dart';
import '../../cubit/register_cubit.dart';
import 'create_account_screen.dart';
import '../../widgets/auth_bottom_prompt.dart';
import '../../widgets/auth_divider.dart';
import '../../widgets/auth_primary_button.dart';
import '../../widgets/auth_scaffold.dart';
import '../../widgets/auth_social_button.dart';
import '../../widgets/auth_text_field.dart';
import '../../widgets/cinemate_logo.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CinemateLogo(),
          SizedBox(height: 24),
          Text(
            'Welcome back',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: CinemateColors.text,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Sign in to continue to CineMate',
            textAlign: TextAlign.center,
            style: TextStyle(color: CinemateColors.muted, fontSize: 11),
          ),
          SizedBox(height: 36),
          AuthTextField(
            label: 'Email',
            hint: 'you@example.com',
            icon: Icons.mail_outline,
          ),
          SizedBox(height: 14),
          AuthTextField(
            label: 'Password',
            hint: 'Enter your password',
            icon: Icons.lock_outline,
            suffixIcon: Icons.visibility_off_outlined,
          ),
          _ForgotPasswordButton(),
          SizedBox(height: 12),
          AuthPrimaryButton(label: 'Sign In'),
          SizedBox(height: 18),
          AuthDivider(),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: AuthSocialButton(
                  icon: Icons.g_mobiledata,
                  label: 'Google',
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: AuthSocialButton(icon: Icons.apple, label: 'Apple'),
              ),
            ],
          ),
          SizedBox(height: 106),
          AuthBottomPrompt(
            prefix: "Don't have an account? ",
            action: 'Create Account',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => getIt<RegisterCubit>(),
                    child: const CreateAccountScreen(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ForgotPasswordButton extends StatelessWidget {
  const _ForgotPasswordButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          foregroundColor: CinemateColors.accent,
          padding: const EdgeInsets.only(top: 7),
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: const Text('Forgot Password?', style: TextStyle(fontSize: 10)),
      ),
    );
  }
}

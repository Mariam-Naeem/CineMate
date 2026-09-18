import 'package:flutter/material.dart';

import '../../../../core/theme/cinemate_theme.dart';
import '../widgets/auth_bottom_prompt.dart';
import '../widgets/auth_primary_button.dart';
import '../widgets/auth_scaffold.dart';
import '../widgets/auth_text_field.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _BackButton(),
          SizedBox(height: 4),
          Text(
            'Create Account',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 4),
          Text(
            'Join CineMate today',
            style: TextStyle(color: CinemateColors.muted, fontSize: 11),
          ),
          SizedBox(height: 32),
          AuthTextField(
            label: 'Full Name',
            hint: 'Alex Johnson',
            icon: Icons.person_outline,
          ),
          SizedBox(height: 14),
          AuthTextField(
            label: 'Email',
            hint: 'alex@example.com',
            icon: Icons.mail_outline,
          ),
          SizedBox(height: 14),
          AuthTextField(
            label: 'Password',
            hint: 'Create a password',
            icon: Icons.lock_outline,
            suffixIcon: Icons.visibility_off_outlined,
          ),
          SizedBox(height: 14),
          AuthTextField(
            label: 'Confirm Password',
            hint: 'Repeat your password',
            icon: Icons.verified_user_outlined,
            suffixIcon: Icons.visibility_off_outlined,
          ),
          SizedBox(height: 12),
          _TermsText(),
          SizedBox(height: 18),
          AuthPrimaryButton(label: 'Create Account'),
          SizedBox(height: 116),
          AuthBottomPrompt(
            prefix: 'Already have an account? ',
            action: 'Sign In',
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: () {},
        style: IconButton.styleFrom(backgroundColor: CinemateColors.field),
        icon: const Icon(Icons.chevron_left, size: 20),
      ),
    );
  }
}

class _TermsText extends StatelessWidget {
  const _TermsText();

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: 'By creating an account, you agree to our ',
        style: TextStyle(color: CinemateColors.muted, fontSize: 8),
        children: [
          TextSpan(
            text: 'Terms of Service',
            style: TextStyle(color: CinemateColors.accent),
          ),
          TextSpan(text: ' and\n'),
          TextSpan(
            text: 'Privacy Policy.',
            style: TextStyle(color: CinemateColors.accent),
          ),
        ],
      ),
    );
  }
}

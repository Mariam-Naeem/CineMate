import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/theme/cinemate_theme.dart';
import '../../../data/models/register_requires_model.dart';
import '../../cubit/register_cubit.dart';
import '../../cubit/register_state.dart';
import '../../widgets/auth_bottom_prompt.dart';
import '../../widgets/auth_primary_button.dart';
import '../../widgets/auth_scaffold.dart';
import '../../widgets/auth_text_field.dart';
import '../../../../home_Screen/presentation/views/home_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  void _submit() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmation = _confirmationController.text;
    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmation.isEmpty) {
      _showMessage('Please fill in all fields.');
      return;
    }
    if (password != confirmation) {
      _showMessage('Passwords do not match.');
      return;
    }
    context.read<RegisterCubit>().register(
      RegisterRequestModel(
        name: name,
        email: email,
        password: password,
        confirmationPassword: confirmation,
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => const HomeScreen()),
            (route) => false,
          );
          return;
        }
        if (state.status == Status.error) {
          _showMessage(state.message ?? 'Something went wrong.');
        }
      },
      child: AuthScaffold(
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
              controller: _nameController,
            ),
            SizedBox(height: 14),
            AuthTextField(
              label: 'Email',
              hint: 'alex@example.com',
              icon: Icons.mail_outline,
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 14),
            AuthTextField(
              label: 'Password',
              hint: 'Create a password',
              icon: Icons.lock_outline,
              suffixIcon: Icons.visibility_off_outlined,
              controller: _passwordController,
            ),
            SizedBox(height: 14),
            AuthTextField(
              label: 'Confirm Password',
              hint: 'Repeat your password',
              icon: Icons.verified_user_outlined,
              suffixIcon: Icons.visibility_off_outlined,
              controller: _confirmationController,
            ),
            SizedBox(height: 12),
            _TermsText(),
            SizedBox(height: 18),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return AuthPrimaryButton(
                  label: state.status == Status.loading
                      ? 'Creating Account...'
                      : 'Create Account',
                  onPressed: state.status == Status.loading ? null : _submit,
                );
              },
            ),
            SizedBox(height: 116),
            AuthBottomPrompt(
              prefix: 'Already have an account? ',
              action: 'Sign In',
            ),
          ],
        ),
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
        onPressed: () => Navigator.of(context).maybePop(),
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

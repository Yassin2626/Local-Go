library;

import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'main_shell.dart';

// Shows the Login screen inside a bottom sheet.
// When login succeeds, closes the sheet and opens MainShell.
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  void _navigateToHome(BuildContext context) {
    final navigator = Navigator.of(context, rootNavigator: true);
    navigator.pop();
    navigator.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const MainShell()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoginScreen(
      onLoginSuccess: () => _navigateToHome(context),
    );
  }
}

library;

import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'onboarding_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Local Go',
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}

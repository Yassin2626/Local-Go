library;

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'auth_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  void _openAuth(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => const AuthScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 65,
            child: Container(
              color: AppColors.primary,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/icon/app_icon.png', width: 280, height: 280),
                    const SizedBox(height: 16),
                    const Text('Local Go', style: TextStyle(color: Colors.white, fontSize: 48, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 35,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(32, 8, 32, 40),
              child: Column(
                children: [
                  const Spacer(),
                  const Text('Eat like a local,\npay like a local', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1976D2), height: 1.2)),
                  const SizedBox(height: 8),
                  Text('Free forever. No credit card needed.', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => _openAuth(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      child: const Text('Get Started', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

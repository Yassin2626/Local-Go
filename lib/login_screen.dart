library;

import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.onLoginSuccess});
  final VoidCallback? onLoginSuccess;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: const Text('Local Go', style: TextStyle(color: Color(0xFF1976D2), fontSize: 32, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 24),
            const Text('Welcome Back', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Enter your details below', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            const SizedBox(height: 32),
            Align(alignment: Alignment.centerLeft, child: Text('EMAIL ADDRESS', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[600]))),
            const SizedBox(height: 6),
            TextField(
              decoration: InputDecoration(
                hintText: 'your@email.com',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            const SizedBox(height: 20),
            Align(alignment: Alignment.centerLeft, child: Text('PASSWORD', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey[600]))),
            const SizedBox(height: 6),
            TextField(
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, size: 20),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.onLoginSuccess,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Sign in', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(onPressed: () {}, child: const Text('Forgot your password?', style: TextStyle(fontSize: 12, color: Colors.grey))),
            const SizedBox(height: 16),
            Row(
              children: [
                const Expanded(child: Divider()),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: Text('Or sign in with', style: TextStyle(fontSize: 11, color: Colors.grey[500]))),
                const Expanded(child: Divider()),
              ],
            ),
            const SizedBox(height: 16),
            SocialLoginButtons(onGoogleTap: () {}, onAppleTap: () {}),
          ],
        ),
      ),
    );
  }
}

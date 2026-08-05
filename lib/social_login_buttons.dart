library;

import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key, this.onGoogleTap, this.onAppleTap});
  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _button(onGoogleTap, Icons.g_mobiledata, 'Google')),
        const SizedBox(width: 16),
        Expanded(child: _button(onAppleTap, Icons.apple, 'Apple')),
      ],
    );
  }

  Widget _button(VoidCallback? onTap, IconData icon, String label) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 20),
      label: Text(label),
      style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
    );
  }
}

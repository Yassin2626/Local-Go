library;

import 'package:flutter/material.dart';
import 'onboarding_screen.dart';
import 'about_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Profile', style: TextStyle(fontWeight: FontWeight.bold)), backgroundColor: Colors.white, elevation: 0.5),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 16),
          const CircleAvatar(radius: 40, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 40, color: Colors.white)),
          const SizedBox(height: 12),
          const Text('Alex Rivera', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text('alex.rivera@email.com', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
          const SizedBox(height: 24),
          Row(children: [
            _stat('12', 'Trips'), const SizedBox(width: 12),
            _stat('8', 'Reviews'), const SizedBox(width: 12),
            _stat('5', 'Guides Met'),
          ]),
          const SizedBox(height: 24),
          const Divider(),           _menuItem(Icons.bookmark, 'Saved Guides', '3'), const Divider(),
          _menuItem(Icons.payment, 'Payment Methods', null), const Divider(),
          _menuItem(Icons.notifications, 'Notifications', null), const Divider(),
          _menuItem(Icons.lock, 'Privacy', null), const Divider(),
          _menuItem(Icons.help_outline, 'Help & Support', null), const Divider(),
          _menuItem(Icons.info_outline, 'About', 'v1.0.0', onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AboutScreen()));
          }),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (_) => const OnboardingScreen()), (route) => false),
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Sign Out', style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 14)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1976D2))),
          const SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ]),
      ),
    );
  }

  Widget _menuItem(IconData icon, String label, String? trailing, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(label, style: const TextStyle(fontSize: 15)),
      trailing: trailing != null ? Text(trailing, style: TextStyle(fontSize: 13, color: Colors.grey[500])) : const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}

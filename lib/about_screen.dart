library;

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Image.asset(
              'assets/icon/app_icon.png',
              width: 240,
              height: 240,
            ),
          ),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Local Go',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'About',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Local Go is an app that lets local guides share their favorite '
            'spots and allows travelers to discover and book those experiences.',
            style: TextStyle(fontSize: 15, height: 1.5, color: Colors.black87),
          ),
          const SizedBox(height: 24),
          _roleSection(
            Icons.star,
            'Guides',
            'Local experts share their knowledge by creating guide profiles, '
            'marking their favorite secret spots, and offering personalized '
            'tours. The more you guide, the more you build your reputation '
            'and earn reviews from travelers.',
          ),
          const SizedBox(height: 16),
          _roleSection(
            Icons.explore,
            'Travelers',
            'Use the live map to discover nearby guides and hidden gems '
            'before you arrive. Browse guide profiles, read reviews, and '
            'connect with the perfect local guide for your adventure.',
          ),
          const SizedBox(height: 24),
          const Text(
            'Features',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _featureItem(Icons.map, 'Interactive Map',
              'Discover nearby guides and secret spots in real time.'),
          _featureItem(Icons.person, 'Guide Profiles',
              'Browse detailed profiles and reviews to find your perfect match.'),
          _featureItem(Icons.chat, 'In-App Messaging',
              'Connect and communicate directly with guides.'),
          _featureItem(Icons.explore, 'Discover',
              'Explore curated categories tailored to your interests.'),
          _featureItem(Icons.account_circle, 'Personal Profile',
              'Track your trips, reviews, and guides you\'ve met.'),
          const SizedBox(height: 32),
          const Divider(),
          const SizedBox(height: 16),
          Center(
            child: Text(
              '© 2026 Local Go. All rights reserved.',
              style: TextStyle(fontSize: 12, color: Colors.grey[500]),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _roleSection(IconData icon, String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.primary.withValues(alpha: 0.1),
            child: Icon(icon, color: AppColors.primary, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(description, style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureItem(IconData icon, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.primary, size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(description, style: TextStyle(fontSize: 13, color: Colors.grey[600], height: 1.4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

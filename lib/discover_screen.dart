library;

import 'package:flutter/material.dart';
import 'guide.dart';
import 'guide_profile_screen.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});
  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String? _selectedCategory;

  static const List<Map<String, String>> _categories = [
    {'icon': 'restaurant', 'label': 'Food'},
    {'icon': 'history', 'label': 'History'},
    {'icon': 'park', 'label': 'Nature'},
    {'icon': 'shopping_bag', 'label': 'Shopping'},
    {'icon': 'music_note', 'label': 'Nightlife'},
    {'icon': 'museum', 'label': 'Culture'},
  ];

  static const List<Guide> _allGuides = [
    Guide(name: 'Heather', age: 24, imageUrl: '', guideCount: 142, area: 'Shinjuku', description: 'NYC native. Specializes in finding hidden gems.', hourlyRate: 25, isVerified: true, rating: 4.9, tourCount: 36, location: 'New York, USA'),
    Guide(name: 'Kenji', age: 58, imageUrl: '', guideCount: 300, area: 'Asakusa', description: 'History buff with 30 years of experience.', hourlyRate: 40, isVerified: true, rating: 4.8, tourCount: 52, location: 'Tokyo, Japan'),
    Guide(name: 'Leo', age: 28, imageUrl: '', guideCount: 45, area: 'Akihabara', description: 'Otaku culture and tech shopping guide.', hourlyRate: 20, isVerified: false, rating: 4.7, tourCount: 18, location: 'Tokyo, Japan'),
    Guide(name: 'Sofia', age: 31, imageUrl: '', guideCount: 89, area: 'Trastevere', description: 'Rome foodie. Knows every family-run trattoria.', hourlyRate: 35, isVerified: true, rating: 4.9, tourCount: 28, location: 'Rome, Italy'),
    Guide(name: 'Marcus', age: 45, imageUrl: '', guideCount: 210, area: 'Montmartre', description: 'Parisian art historian. Hidden galleries.', hourlyRate: 50, isVerified: true, rating: 4.7, tourCount: 67, location: 'Paris, France'),
    Guide(name: 'Priya', age: 27, imageUrl: '', guideCount: 67, area: 'Khao San', description: 'Street food expert. Let\'s eat our way through Bangkok!', hourlyRate: 15, isVerified: false, rating: 4.6, tourCount: 22, location: 'Bangkok, Thailand'),
  ];

  static const Map<String, List<String>> _guideCategories = {
    'Heather': ['Food', 'Shopping'],
    'Kenji': ['History', 'Culture'],
    'Leo': ['Shopping', 'Nightlife'],
    'Sofia': ['Food', 'Culture'],
    'Marcus': ['History', 'Culture', 'Nature'],
    'Priya': ['Food', 'Nightlife'],
  };

  List<Guide> get _filteredGuides {
    if (_selectedCategory == null) return _allGuides;
    return _allGuides
        .where((g) => (_guideCategories[g.name] ?? []).contains(_selectedCategory))
        .toList();
  }

  IconData _icon(String name) {
    switch (name) {
      case 'restaurant': return Icons.restaurant;
      case 'history': return Icons.history;
      case 'park': return Icons.park;
      case 'shopping_bag': return Icons.shopping_bag;
      case 'music_note': return Icons.music_note;
      case 'museum': return Icons.museum;
      default: return Icons.explore;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Discover', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, _) => const SizedBox(width: 8),
              itemBuilder: (_, i) {
                final cat = _categories[i];
                final active = _selectedCategory == cat['label'];
                return GestureDetector(
                  onTap: () => setState(() => _selectedCategory = active ? null : cat['label']),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: active ? const Color(0xFF1976D2) : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Icon(_icon(cat['icon']!), size: 16, color: active ? Colors.white : Colors.black87),
                      const SizedBox(width: 6),
                      Text(cat['label']!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: active ? Colors.white : Colors.black87)),
                    ]),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _selectedCategory != null ? '$_selectedCategory Guides' : 'Featured Guides',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          if (_filteredGuides.isEmpty)
            Padding(padding: const EdgeInsets.all(32), child: Text('No guides found for this category.', style: TextStyle(color: Colors.grey[600])))
          else
            ..._filteredGuides.map((guide) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(backgroundColor: Colors.grey[300], child: Text(guide.name[0], style: const TextStyle(fontWeight: FontWeight.bold))),
                title: Text(guide.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text('${guide.subtitle} \$${guide.hourlyRate}/hr', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => GuideProfileScreen(guide: guide))),
              ),
            )),
        ],
      ),
    );
  }
}

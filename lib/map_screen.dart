library;

import 'package:flutter/material.dart';
import 'guide.dart';
import 'guide_summary_sheet.dart';
import 'guide_profile_screen.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _showSummary = false;
  Guide? _selectedGuide;
  String _activeFilter = 'All';

  static final List<Guide> _allGuides = [
    Guide(name: 'Heather', age: 24, imageUrl: '', guideCount: 142, area: 'Shinjuku', description: 'NYC native. Hidden gems.', hourlyRate: 25, isVerified: true, rating: 4.9, tourCount: 36, location: 'New York, USA'),
    Guide(name: 'Kenji', age: 58, imageUrl: '', guideCount: 300, area: 'Asakusa', description: 'History buff.', hourlyRate: 40, isVerified: true, rating: 4.8, tourCount: 52, location: 'Tokyo, Japan'),
    Guide(name: 'Leo', age: 28, imageUrl: '', guideCount: 45, area: 'Akihabara', description: 'Tech shopping guide.', hourlyRate: 20, isVerified: false, rating: 4.7, tourCount: 18, location: 'Tokyo, Japan'),
    Guide(name: 'Sofia', age: 31, imageUrl: '', guideCount: 89, area: 'Trastevere', description: 'Rome foodie.', hourlyRate: 35, isVerified: true, rating: 4.9, tourCount: 28, location: 'Rome, Italy'),
    Guide(name: 'Marcus', age: 45, imageUrl: '', guideCount: 210, area: 'Montmartre', description: 'Art historian.', hourlyRate: 50, isVerified: true, rating: 4.7, tourCount: 67, location: 'Paris, France'),
    Guide(name: 'Priya', age: 27, imageUrl: '', guideCount: 67, area: 'Khao San', description: 'Street food expert.', hourlyRate: 15, isVerified: false, rating: 4.6, tourCount: 22, location: 'Bangkok, Thailand'),
  ];

  static const Map<String, List<String>> _guideFilters = {
    'Heather': ['Local Eats', 'Hidden Gems', 'Budget Friendly'],
    'Kenji': ['Hidden Gems', 'Nature & Parks'],
    'Leo': ['Nightlife', 'Street Art', 'Budget Friendly'],
    'Sofia': ['Local Eats', 'Hidden Gems'],
    'Marcus': ['Street Art', 'Hidden Gems', 'Nature & Parks'],
    'Priya': ['Local Eats', 'Nightlife', 'Budget Friendly'],
  };

  static const List<String> _filters = ['All', 'Local Eats', 'Hidden Gems', 'Budget Friendly', 'Nightlife', 'Nature & Parks', 'Street Art'];

  List<Guide> get _filteredGuides {
    if (_activeFilter == 'All') return _allGuides;
    return _allGuides.where((g) => (_guideFilters[g.name] ?? []).contains(_activeFilter)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final guides = _filteredGuides;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Positioned.fill(child: Container(color: Colors.grey[200])),
          Positioned(top: 44, left: 20, right: 20, child: Column(children: [
            Container(height: 48, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.grey[300]!)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search city, zip code...', border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 36,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _filters.length,
                separatorBuilder: (_, _) => const SizedBox(width: 6),
                itemBuilder: (_, i) {
                  final active = _filters[i] == _activeFilter;
                  return GestureDetector(
                    onTap: () => setState(() { _activeFilter = _filters[i]; _showSummary = false; _selectedGuide = null; }),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(color: active ? const Color(0xFF1976D2) : Colors.white, borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: active ? const Color(0xFF1976D2) : Colors.grey[300]!)),
                      child: Text(_filters[i], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: active ? Colors.white : Colors.black87)),
                    ),
                  );
                },
              ),
            ),
          ])),
          ...List.generate(guides.length, (i) {
            final pos = _allGuides.indexOf(guides[i]);
            final offsets = [Offset(0.25, 0.35), Offset(0.70, 0.45), Offset(0.40, 0.65), Offset(0.55, 0.25), Offset(0.15, 0.55), Offset(0.80, 0.70)];
            final p = offsets[pos >= 0 ? pos : 0];
            return Positioned(
              left: p.dx * MediaQuery.of(context).size.width,
              top: p.dy * MediaQuery.of(context).size.height,
              child: GestureDetector(
                onTap: () => setState(() { _selectedGuide = guides[i]; _showSummary = true; }),
                child: Container(width: 44, height: 44,
                  decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border.all(color: const Color(0xFF1976D2), width: 2)),
                  child: Center(child: Text(guides[i].name[0], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1976D2)))),
                ),
              ),
            );
          }),
          if (_showSummary && _selectedGuide != null)
            Positioned(left: 0, right: 0, bottom: 0,
              child: GuideSummarySheet(guide: _selectedGuide!,
                onViewProfile: () {
                  final g = _selectedGuide!;
                  setState(() { _showSummary = false; _selectedGuide = null; });
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => GuideProfileScreen(guide: g)));
                },
                onDismiss: () => setState(() { _showSummary = false; _selectedGuide = null; }),
              ),
            ),
        ],
      ),
    );
  }
}

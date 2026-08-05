library;

import 'package:flutter/material.dart';
import 'chat.dart';
import 'guide.dart';
import 'chat_detail_screen.dart';

const List<SecretSpot> _sampleSpots = [
  SecretSpot(name: "Da Enzo's Garden", description: 'The best Cacio e Pepe in Rome.', imageUrl: '', distance: '0.4 km', type: 'Bistro'),
  SecretSpot(name: 'The Orange Grove', description: 'Wait for sunset here.', imageUrl: '', distance: '1.2 km', type: 'Secret Garden'),
  SecretSpot(name: 'Midnight Ramen', description: 'Only open after 11 PM.', imageUrl: '', distance: '2.3 km', type: 'Food Stall'),
];

const List<GuideReview> _sampleReviews = [
  GuideReview(reviewerName: 'James Dalton', initials: 'JD', date: 'June 2024', rating: 5, comment: 'Incredible! She took us to places we never would have found.'),
  GuideReview(reviewerName: 'Maria Lopez', initials: 'ML', date: 'May 2024', rating: 4, comment: 'Such a warm personality. Highly recommend!'),
];

class GuideProfileScreen extends StatelessWidget {
  const GuideProfileScreen({super.key, required this.guide});
  final Guide guide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(guide.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        backgroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(child: Column(children: [
            CircleAvatar(radius: 48, backgroundColor: Colors.grey[300], child: Text(guide.name[0], style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.grey[700]))),
            const SizedBox(height: 12),
            Text(guide.name, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 4),
              Text(guide.location, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            ]),
          ])),
          const SizedBox(height: 24),
          Row(children: [
            _stat('${guide.rating}', 'Rating'),
            const SizedBox(width: 12),
            _stat('${guide.guideCount}', 'Guided'),
            const SizedBox(width: 12),
            _stat('${guide.tourCount}', 'Tours'),
          ]),
          const SizedBox(height: 24),
          if (guide.quote.isNotEmpty) ...[
            Container(padding: const EdgeInsets.all(16), decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)), child: Text('"${guide.quote}"', style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 14))),
            const SizedBox(height: 24),
          ],
          const Text('Best Spots', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          SizedBox(
            height: 100,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _sampleSpots.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (_, i) {
                final spot = _sampleSpots[i];
                return Container(
                  width: 180, padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(spot.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height: 4),
                    Text(spot.description, style: TextStyle(fontSize: 12, color: Colors.grey[600]), maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text('${spot.distance} \u2022 ${spot.type}', style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                  ]),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          const Text('Traveler Reviews', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ..._sampleReviews.map((r) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: Padding(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                CircleAvatar(radius: 16, backgroundColor: Colors.grey[300], child: Text(r.initials, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold))),
                const SizedBox(width: 8),
                Expanded(child: Text(r.reviewerName, style: const TextStyle(fontWeight: FontWeight.w600))),
                Row(children: List.generate(5, (i) => Icon(Icons.star, size: 14, color: i < r.rating ? Colors.amber : Colors.grey[300]))),
              ]),
              const SizedBox(height: 8),
              Text('"${r.comment}"', style: TextStyle(fontSize: 13, color: Colors.grey[700])),
              Text(r.date, style: TextStyle(fontSize: 11, color: Colors.grey[500])),
            ])),
          )),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                final chat = Chat(name: guide.name, imageUrl: guide.imageUrl, lastMessage: 'Hi! I\'d love to explore the city with you.', timestamp: 'Just now', isOnline: true);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => ChatDetailScreen(chat: chat)));
              },
              icon: const Icon(Icons.chat_bubble, color: Colors.white),
              label: const Text('Connect and Chat', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1976D2), foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String value, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
        child: Column(children: [
          Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1976D2))),
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
        ]),
      ),
    );
  }
}

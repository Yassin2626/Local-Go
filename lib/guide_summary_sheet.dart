library;

import 'package:flutter/material.dart';
import 'guide.dart';

class GuideSummarySheet extends StatelessWidget {
  const GuideSummarySheet({super.key, required this.guide, this.onViewProfile, this.onDismiss});
  final Guide guide;
  final VoidCallback? onViewProfile;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10)]),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(children: [
          CircleAvatar(backgroundColor: Colors.grey[300], child: Text(guide.name[0], style: const TextStyle(fontWeight: FontWeight.bold))),
          const SizedBox(width: 12),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(guide.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Text(guide.subtitle, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ])),
          Text('\$${guide.hourlyRate}/hr', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1976D2))),
        ]),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onViewProfile,
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF1976D2), foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
            child: const Text('View Profile'),
          ),
        ),
      ]),
    );
  }
}

library;

import 'package:flutter/material.dart';
import 'app_colors.dart';

enum BottomNavTab { map, discover, messages, profile }

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, this.currentTab = BottomNavTab.map, this.onTabSelected});
  final BottomNavTab currentTab;
  final ValueChanged<BottomNavTab>? onTabSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 4, bottom: 4),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildTab(BottomNavTab.map, Icons.map, 'Map'),
            _buildTab(BottomNavTab.discover, Icons.explore, 'Discover'),
            _buildTab(BottomNavTab.messages, Icons.chat, 'Messages'),
            _buildTab(BottomNavTab.profile, Icons.person, 'Profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(BottomNavTab tab, IconData icon, String label) {
    final active = tab == currentTab;
    return GestureDetector(
      onTap: () => onTabSelected?.call(tab),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 24, color: active ? AppColors.primary : Colors.grey),
          Text(label, style: TextStyle(fontSize: 11, color: active ? AppColors.primary : Colors.grey)),
        ],
      ),
    );
  }
}

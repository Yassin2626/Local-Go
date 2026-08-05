library;

import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'map_screen.dart';
import 'discover_screen.dart';
import 'messages_screen.dart';
import 'profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    MapScreen(),
    DiscoverScreen(),
    MessagesScreen(),
    ProfileScreen(),
  ];

  static const List<BottomNavTab> _tabs = [
    BottomNavTab.map,
    BottomNavTab.discover,
    BottomNavTab.messages,
    BottomNavTab.profile,
  ];

  void _onTabSelected(BottomNavTab tab) {
    final index = _tabs.indexOf(tab);
    if (index >= 0) {
      setState(() => _currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(index: _currentIndex, children: _screens),
          Positioned(
            left: 0, right: 0, bottom: 0,
            child: BottomNavBar(currentTab: _tabs[_currentIndex], onTabSelected: _onTabSelected),
          ),
        ],
      ),
    );
  }
}

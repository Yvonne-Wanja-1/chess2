import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../widgets/home_content.dart';
import '../widgets/app_drawer.dart';
import '../../../play/presentation/screens/play_screen.dart';
import '../../../learn/presentation/screens/learn_screen.dart';
import '../../../social/presentation/screens/social_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../../../../shared/widgets/chess_knight_icon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 2; // Center item selected by default

  final List<Widget> _screens = const [
    PlayScreen(),
    LearnScreen(),
    HomeContent(),
    SocialScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chess\'d Up'),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Implement notifications
            },
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _screens[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        color: Theme.of(context).colorScheme.primary,
        buttonBackgroundColor: Theme.of(context).colorScheme.primary,
        height: 60,
        items: const [
          ChessKnightIcon(color: Colors.white, size: 24),
          Icon(Icons.school, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.people, color: Colors.white),
          Icon(Icons.person, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

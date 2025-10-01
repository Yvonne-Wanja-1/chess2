import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../widgets/home_content.dart';
import '../widgets/app_drawer.dart';
import '../../../play/presentation/screens/play_screen.dart';
import '../../../learn/presentation/screens/learn_screen.dart';
import '../../../social/presentation/screens/social_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';

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
          Icon(Icons.sports_esports, color: Colors.white), // Game icon for play
          Icon(Icons.school, color: Colors.white), // Keep school for learn
          Icon(Icons.home, color: Colors.white), // Keep home for home
          Icon(Icons.people, color: Colors.white), // Keep people for social
          Icon(Icons.person, color: Colors.white), // Keep person for profile
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

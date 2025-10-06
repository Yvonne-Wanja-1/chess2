import 'package:flutter/material.dart';
import './config/theme.dart';
import './config/constants.dart';
import './features/auth/presentation/screens/splash_screen.dart';
import './features/screens/quick_play_screen.dart';
import './features/screens/custom_game_screen.dart';
import './features/screens/tournaments_screen.dart';
import './features/screens/training_screen.dart';
import './features/screens/stats_screen.dart';
import './features/screens/teams_screen.dart';
import './features/screens/messages_screen.dart';
import './features/screens/settings_screen.dart';
import './features/screens/help_support_screen.dart';
import './features/screens/find_players_screen.dart';
import './features/screens/roast_screen.dart';
import './features/screens/social_media_screen.dart';
import './features/social/screens/achievements_screen.dart';
import './features/social/screens/spectator_screen.dart';
import './features/social/screens/avatar_customization_screen.dart';

void main() {
  runApp(const ChessdUpApp());
}

class ChessdUpApp extends StatelessWidget {
  const ChessdUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: ChessdUpTheme.lightTheme,
      darkTheme: ChessdUpTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        '/quick-play': (context) => const QuickPlayScreen(),
        '/custom-game': (context) => const CustomGameScreen(),
        '/tournaments': (context) => const TournamentsScreen(),
        '/training': (context) => const TrainingScreen(),
        '/stats': (context) => const StatsScreen(),
        '/teams': (context) => const TeamsScreen(),
        '/messages': (context) => const MessagesScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/help': (context) => const HelpSupportScreen(),
        '/find-players': (context) => const FindPlayersScreen(),
        '/roast': (context) => const RoastScreen(),
        '/social': (context) => const SocialMediaScreen(),
        '/achievements': (context) => const AchievementsScreen(),
        '/spectator': (context) => const SpectatorScreen(),
        '/avatar': (context) => const AvatarCustomizationScreen(),
      },
    );
  }
}

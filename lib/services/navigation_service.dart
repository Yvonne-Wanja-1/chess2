import 'package:flutter/material.dart';

class NavigationService {
  static void navigateToQuickPlay(BuildContext context) {
    Navigator.pushNamed(context, '/quick-play');
  }

  static void navigateToCustomGame(BuildContext context) {
    Navigator.pushNamed(context, '/custom-game');
  }

  static void navigateToTournaments(BuildContext context) {
    Navigator.pushNamed(context, '/tournaments');
  }

  static void navigateToTraining(BuildContext context) {
    Navigator.pushNamed(context, '/training');
  }

  static void navigateToStats(BuildContext context) {
    Navigator.pushNamed(context, '/stats');
  }

  static void navigateToTeams(BuildContext context) {
    Navigator.pushNamed(context, '/teams');
  }

  static void navigateToMessages(BuildContext context) {
    Navigator.pushNamed(context, '/messages');
  }

  static void navigateToSettings(BuildContext context) {
    Navigator.pushNamed(context, '/settings');
  }

  static void navigateToHelp(BuildContext context) {
    Navigator.pushNamed(context, '/help');
  }
}

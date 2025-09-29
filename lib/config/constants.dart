class AppConstants {
  static const String appName = "Chess'd Up";

  // Firebase Collections
  static const String usersCollection = 'users';
  static const String matchesCollection = 'matches';
  static const String teamsCollection = 'teams';
  static const String schoolsCollection = 'schools';
  static const String puzzlesCollection = 'puzzles';

  // Game Types
  static const String blitzGame = 'blitz';
  static const String rapidGame = 'rapid';
  static const String bulletGame = 'bullet';
  static const String puzzleRush = 'puzzle_rush';
  static const String chess960 = 'chess960';

  // Time Controls (in minutes)
  static const int blitzTime = 5;
  static const int rapidTime = 15;
  static const int bulletTime = 1;

  // Rating Constants
  static const int initialRating = 1200;
  static const int maxRatingChange = 32;

  // Achievement Types
  static const String winStreak = 'win_streak';
  static const String puzzleMaster = 'puzzle_master';
  static const String teamPlayer = 'team_player';
  static const String schoolChampion = 'school_champion';

  // Asset Paths
  static const String defaultAvatarPath = 'assets/images/default_avatar.png';
  static const String defaultBoardPath =
      'assets/images/boards/default_board.svg';
  static const String defaultPiecesPath = 'assets/images/pieces/default/';
}

import 'dart:math';

class TrashTalkAI {
  static final List<String> _openings = [
    "Your chess skills are like a broken clock - right twice a day!",
    "I've seen better moves in a game of checkers!",
    "Your strategy is as solid as a chocolate teapot!",
    "Even a random move generator plays better than you!",
    "Did you learn chess from a pigeon?",
  ];

  static final List<String> _midGame = [
    "That move was so bad, even your pawn is facepalming!",
    "Are you trying to lose creatively?",
    "Your position is weaker than decaf coffee!",
    "I've seen better defensive walls in a sandcastle!",
    "Your pieces are more scattered than my weekend plans!",
  ];

  static final List<String> _endGame = [
    "Your endgame is like a maze - no clear way out!",
    "Might want to stick to playing against easy bots!",
    "Your king's running around like a headless chicken!",
    "Time to trade your chess pieces for checkers!",
    "Even my grandma's computer plays better than this!",
  ];

  static final List<String> _goodSport = [
    "Not bad... for a beginner! 😉",
    "You're improving! Maybe in 10 years you'll be decent! 😄",
    "That was actually a good move... did someone help you? 🤔",
    "I'm impressed! You're almost playing at a kindergarten level! 🌟",
    "Keep practicing! You might beat a random move bot someday! 💪",
  ];

  static String generateTrashTalk({
    required String gamePhase,
    required int playerRating,
    required int opponentRating,
    required bool keepItFriendly,
  }) {
    final random = Random();
    List<String> pool;

    switch (gamePhase.toLowerCase()) {
      case 'opening':
        pool = _openings;
        break;
      case 'midgame':
        pool = _midGame;
        break;
      case 'endgame':
        pool = _endGame;
        break;
      default:
        pool = [..._openings, ..._midGame, ..._endGame];
    }

    if (keepItFriendly || (playerRating - opponentRating).abs() > 300) {
      pool = _goodSport;
    }

    return pool[random.nextInt(pool.length)];
  }

  static String generateResponse(String incomingTrashTalk) {
    // TODO: Implement more sophisticated response generation based on incoming trash talk
    final responses = [
      "Is that the best you've got? My chess engine runs on a potato and still plays better!",
      "Talk is cheap, like your opening moves! 😏",
      "Save your energy for the game, you'll need it! 💪",
      "I'd be trash-talking too if I played like that! 😉",
      "Your trash talk is like your chess - predictable! 🎯",
    ];

    return responses[Random().nextInt(responses.length)];
  }
}

// Usage example:
// final trashTalk = TrashTalkAI.generateTrashTalk(
//   gamePhase: 'opening',
//   playerRating: 1200,
//   opponentRating: 1100,
//   keepItFriendly: true,
// );

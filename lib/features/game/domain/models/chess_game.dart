import 'package:chess/chess.dart' as chess;

enum GameType { blitz, rapid, bullet, puzzle, chess960 }

class ChessGame {
  final String id;
  final String whitePlayerId;
  final String blackPlayerId;
  final GameType type;
  final DateTime startTime;
  final int timeControlInSeconds;
  final chess.Chess _board;

  String? winner;
  String? result;
  List<String> moves = [];
  DateTime? endTime;

  ChessGame({
    required this.id,
    required this.whitePlayerId,
    required this.blackPlayerId,
    required this.type,
    required this.startTime,
    required this.timeControlInSeconds,
  }) : _board = chess.Chess();

  bool makeMove(String move) {
    try {
      final result = _board.move(move);
      if (result) {
        moves.add(move);
        _checkGameEnd();
      }
      return result;
    } catch (e) {
      return false;
    }
  }

  String getFen() => _board.fen;

  List<String> getLegalMoves() =>
      _board.generate_moves().map((m) => m.toString()).toList();

  bool isGameOver() => _board.game_over;

  void _checkGameEnd() {
    if (_board.in_checkmate) {
      winner = _board.turn == chess.Color.WHITE ? blackPlayerId : whitePlayerId;
      result = 'checkmate';
    } else if (_board.in_draw) {
      result = 'draw';
    } else if (_board.in_stalemate) {
      result = 'stalemate';
    } else if (_board.insufficient_material) {
      result = 'insufficient material';
    } else if (_board.in_threefold_repetition) {
      result = 'threefold repetition';
    }

    if (result != null) {
      endTime = DateTime.now();
    }
  }
}

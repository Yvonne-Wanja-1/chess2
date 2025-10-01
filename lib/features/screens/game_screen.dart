import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  final String gameMode;
  final int timeControl;

  const GameScreen({
    super.key,
    required this.gameMode,
    required this.timeControl,
  });

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.gameMode} - ${widget.timeControl} min'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Show game settings
              showDialog(
                context: context,
                builder: (context) => _buildSettingsDialog(context),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildGameInfo(context),
          Expanded(child: _buildChessBoard(context)),
          _buildGameControls(context),
        ],
      ),
    );
  }

  Widget _buildGameInfo(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildPlayerInfo(context, 'Opponent', '1500', true),
          _buildTimer(context, widget.timeControl * 60),
        ],
      ),
    );
  }

  Widget _buildPlayerInfo(
    BuildContext context,
    String name,
    String rating,
    bool isOpponent,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          child: Text(name[0], style: const TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 8),
        Text(name, style: Theme.of(context).textTheme.titleMedium),
        Text('Rating: $rating', style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }

  Widget _buildTimer(BuildContext context, int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        '$minutes:${remainingSeconds.toString().padLeft(2, '0')}',
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }

  Widget _buildChessBoard(BuildContext context) {
    // Placeholder for the chess board
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
      ),
      itemCount: 64,
      itemBuilder: (context, index) {
        final isWhite = ((index ~/ 8) + index) % 2 == 0;
        return Container(color: isWhite ? Colors.white : Colors.grey[800]);
      },
    );
  }

  Widget _buildGameControls(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              // Undo last move
            },
          ),
          IconButton(
            icon: const Icon(Icons.flag),
            onPressed: () {
              // Offer draw or resign
              _showGameOptionsDialog(context);
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Open chat
              _showChatDialog(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> _showGameOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Game Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.handshake),
              title: const Text('Offer Draw'),
              onTap: () {
                Navigator.pop(context);
                // Implement draw offer
              },
            ),
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('Resign'),
              onTap: () {
                Navigator.pop(context);
                // Implement resignation
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showChatDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Chat'),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: const [Text('Good game!'), Text('Thanks!')],
                ),
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Type a message...',
                ),
                onSubmitted: (value) {
                  // Implement chat
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Game Settings'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SwitchListTile(
            title: const Text('Sound Effects'),
            value: true,
            onChanged: (value) {
              // Implement sound settings
            },
          ),
          SwitchListTile(
            title: const Text('Move Hints'),
            value: false,
            onChanged: (value) {
              // Implement hints settings
            },
          ),
          SwitchListTile(
            title: const Text('Coordinates'),
            value: true,
            onChanged: (value) {
              // Implement coordinates settings
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}

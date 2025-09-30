import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Game Modes Section
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Game Modes',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                _GameModeButton(
                  icon: Icons.timer,
                  title: 'Classic',
                  subtitle: 'Standard chess game',
                  onTap: () {
                    // TODO: Navigate to classic game setup
                  },
                ),
                _GameModeButton(
                  icon: Icons.casino,
                  title: 'Chess960',
                  subtitle: 'Random piece placement',
                  onTap: () {
                    // TODO: Navigate to chess960 setup
                  },
                ),
                _GameModeButton(
                  icon: Icons.bolt,
                  title: 'Bullet',
                  subtitle: '1 minute per side',
                  onTap: () {
                    // TODO: Navigate to bullet setup
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Current Games Section
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current Games',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                _GameListItem(
                  opponent: 'Magnus C.',
                  gameType: 'Classical',
                  lastMove: '2 hours ago',
                  onTap: () {
                    // TODO: Navigate to game
                  },
                ),
                const Divider(),
                _GameListItem(
                  opponent: 'Hikaru N.',
                  gameType: 'Bullet',
                  lastMove: '5 minutes ago',
                  onTap: () {
                    // TODO: Navigate to game
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Match History
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Match History',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Navigate to full history
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _MatchHistoryItem(
                  opponent: 'Beth H.',
                  result: 'Won',
                  date: '2 days ago',
                  rating: '+8',
                  onTap: () {
                    // TODO: Show match details
                  },
                ),
                const Divider(),
                _MatchHistoryItem(
                  opponent: 'Viswanathan A.',
                  result: 'Lost',
                  date: '3 days ago',
                  rating: '-12',
                  onTap: () {
                    // TODO: Show match details
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GameModeButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _GameModeButton({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 32),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _GameListItem extends StatelessWidget {
  final String opponent;
  final String gameType;
  final String lastMove;
  final VoidCallback onTap;

  const _GameListItem({
    required this.opponent,
    required this.gameType,
    required this.lastMove,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(opponent),
      subtitle: Text('$gameType • Last move $lastMove'),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _MatchHistoryItem extends StatelessWidget {
  final String opponent;
  final String result;
  final String date;
  final String rating;
  final VoidCallback onTap;

  const _MatchHistoryItem({
    required this.opponent,
    required this.result,
    required this.date,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isWin = result == 'Won';
    final ratingColor = isWin ? Colors.green : Colors.red;

    return ListTile(
      title: Text(opponent),
      subtitle: Text('$result • $date'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rating,
            style: TextStyle(color: ratingColor, fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
      onTap: onTap,
    );
  }
}

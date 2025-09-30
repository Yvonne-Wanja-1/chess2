import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Profile Header
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    'assets/images/default_avatar.png',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Guest User',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                Text(
                  'Rating: 1200',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatItem(
                      label: 'Games',
                      value: '156',
                      onTap: () {
                        // TODO: Show games history
                      },
                    ),
                    _StatItem(
                      label: 'Wins',
                      value: '89',
                      onTap: () {
                        // TODO: Show wins details
                      },
                    ),
                    _StatItem(
                      label: 'Tournaments',
                      value: '12',
                      onTap: () {
                        // TODO: Show tournament history
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Stats Overview
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Stats Overview',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                _StatsRow(
                  title: 'Win Rate',
                  value: '57%',
                  icon: Icons.emoji_events,
                ),
                const SizedBox(height: 12),
                _StatsRow(
                  title: 'Average Game Length',
                  value: '25 moves',
                  icon: Icons.timer,
                ),
                const SizedBox(height: 12),
                _StatsRow(
                  title: 'Favorite Opening',
                  value: 'Sicilian Defense',
                  icon: Icons.sports_score,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Achievements
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Achievements',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                _AchievementItem(
                  icon: Icons.military_tech,
                  title: 'First Victory',
                  description: 'Won your first game',
                  isUnlocked: true,
                  onTap: () {
                    // TODO: Show achievement details
                  },
                ),
                const Divider(),
                _AchievementItem(
                  icon: Icons.psychology,
                  title: 'Tactical Genius',
                  description: 'Win a game with a brilliant move',
                  isUnlocked: false,
                  onTap: () {
                    // TODO: Show achievement details
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Recent Games
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
                      'Recent Games',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    TextButton(
                      onPressed: () {
                        // TODO: Show all games
                      },
                      child: const Text('See All'),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _GameHistoryItem(
                  opponent: 'Alice',
                  result: 'Won',
                  date: 'Today',
                  rating: '+8',
                  onTap: () {
                    // TODO: Show game details
                  },
                ),
                const Divider(),
                _GameHistoryItem(
                  opponent: 'Bob',
                  result: 'Lost',
                  date: 'Yesterday',
                  rating: '-12',
                  onTap: () {
                    // TODO: Show game details
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

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final VoidCallback onTap;

  const _StatItem({
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(value, style: Theme.of(context).textTheme.headlineSmall),
            Text(label, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatsRow({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 12),
        Text(title),
        const Spacer(),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _AchievementItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isUnlocked;
  final VoidCallback onTap;

  const _AchievementItem({
    required this.icon,
    required this.title,
    required this.description,
    required this.isUnlocked,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: isUnlocked
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).disabledColor,
        size: 32,
      ),
      title: Text(title),
      subtitle: Text(description),
      trailing: isUnlocked
          ? const Icon(Icons.check_circle, color: Colors.green)
          : const Icon(Icons.lock, color: Colors.grey),
      onTap: onTap,
    );
  }
}

class _GameHistoryItem extends StatelessWidget {
  final String opponent;
  final String result;
  final String date;
  final String rating;
  final VoidCallback onTap;

  const _GameHistoryItem({
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

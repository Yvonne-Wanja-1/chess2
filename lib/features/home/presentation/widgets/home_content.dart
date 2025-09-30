import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Quick Play Card
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Play',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _QuickPlayButton(
                      icon: Icons.bolt,
                      label: 'Blitz',
                      onTap: () {
                        // TODO: Implement blitz match
                      },
                    ),
                    _QuickPlayButton(
                      icon: Icons.timer,
                      label: 'Rapid',
                      onTap: () {
                        // TODO: Implement rapid match
                      },
                    ),
                    _QuickPlayButton(
                      icon: Icons.flash_on,
                      label: 'Bullet',
                      onTap: () {
                        // TODO: Implement bullet match
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Daily Puzzle
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
                      'Daily Puzzle',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Rating: 1500',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    // TODO: Add actual chess board widget here
                    child: const Center(child: Text('Chess Board')),
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Implement solve puzzle
                  },
                  child: const Text('Solve Puzzle'),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Active Tournaments
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active Tournaments',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                _TournamentItem(
                  title: 'School Championship',
                  participants: '32/64',
                  timeLeft: '2 days left',
                  onTap: () {
                    // TODO: Navigate to tournament details
                  },
                ),
                const Divider(),
                _TournamentItem(
                  title: 'Weekend Blitz',
                  participants: '128/128',
                  timeLeft: 'Starting in 1 hour',
                  onTap: () {
                    // TODO: Navigate to tournament details
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Recent Activity
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Activity',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                _ActivityItem(
                  avatar: const CircleAvatar(child: Text('JD')),
                  text: 'John Doe won against you',
                  timeAgo: '2h ago',
                  onTap: () {
                    // TODO: Show game details
                  },
                ),
                const Divider(),
                _ActivityItem(
                  avatar: const CircleAvatar(child: Text('KC')),
                  text: 'Knights Club invited you to join',
                  timeAgo: '5h ago',
                  onTap: () {
                    // TODO: Show invitation
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

class _QuickPlayButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickPlayButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class _TournamentItem extends StatelessWidget {
  final String title;
  final String participants;
  final String timeLeft;
  final VoidCallback onTap;

  const _TournamentItem({
    required this.title,
    required this.participants,
    required this.timeLeft,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('$participants • $timeLeft'),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final Widget avatar;
  final String text;
  final String timeAgo;
  final VoidCallback onTap;

  const _ActivityItem({
    required this.avatar,
    required this.text,
    required this.timeAgo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: avatar,
      title: Text(text),
      subtitle: Text(timeAgo),
      onTap: onTap,
    );
  }
}

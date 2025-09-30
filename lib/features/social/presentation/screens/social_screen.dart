import 'package:flutter/material.dart';

class SocialScreen extends StatelessWidget {
  const SocialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Teams Section
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Teams',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                _TeamItem(
                  name: 'City Chess Club',
                  members: '24 members',
                  rating: 'Team Rating: 1800',
                  onTap: () {
                    // TODO: Navigate to team details
                  },
                ),
                const Divider(),
                _TeamItem(
                  name: 'School Chess Team',
                  members: '12 members',
                  rating: 'Team Rating: 1650',
                  onTap: () {
                    // TODO: Navigate to team details
                  },
                ),
                const SizedBox(height: 8),
                Center(
                  child: TextButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text('Create or Join Team'),
                    onPressed: () {
                      // TODO: Show team creation/join dialog
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Friends Section
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
                      'Friends',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    IconButton(
                      icon: const Icon(Icons.person_add),
                      onPressed: () {
                        // TODO: Show add friend dialog
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _FriendItem(
                  name: 'Alice Johnson',
                  rating: '1750',
                  status: 'Online',
                  onTap: () {
                    // TODO: Navigate to friend profile
                  },
                  onChallenge: () {
                    // TODO: Send game challenge
                  },
                ),
                const Divider(),
                _FriendItem(
                  name: 'Bob Smith',
                  rating: '1620',
                  status: 'In Game',
                  onTap: () {
                    // TODO: Navigate to friend profile
                  },
                  onChallenge: () {
                    // TODO: Send game challenge
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
                  avatar: 'AJ',
                  text: 'Alice Johnson won against Bob Smith',
                  timeAgo: '2h ago',
                  onTap: () {
                    // TODO: Show game details
                  },
                ),
                const Divider(),
                _ActivityItem(
                  avatar: 'CC',
                  text: 'City Chess Club tournament starts in 2 hours',
                  timeAgo: '5h ago',
                  onTap: () {
                    // TODO: Show tournament details
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

class _TeamItem extends StatelessWidget {
  final String name;
  final String members;
  final String rating;
  final VoidCallback onTap;

  const _TeamItem({
    required this.name,
    required this.members,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Text(
          name.substring(0, 2),
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      title: Text(name),
      subtitle: Text('$members • $rating'),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

class _FriendItem extends StatelessWidget {
  final String name;
  final String rating;
  final String status;
  final VoidCallback onTap;
  final VoidCallback onChallenge;

  const _FriendItem({
    required this.name,
    required this.rating,
    required this.status,
    required this.onTap,
    required this.onChallenge,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Text(
          name.substring(0, 2),
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      title: Text(name),
      subtitle: Text('Rating: $rating • $status'),
      trailing: IconButton(
        icon: const Icon(Icons.sports_esports),
        onPressed: onChallenge,
      ),
      onTap: onTap,
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final String avatar;
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
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Text(
          avatar,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      title: Text(text),
      subtitle: Text(timeAgo),
      onTap: onTap,
    );
  }
}

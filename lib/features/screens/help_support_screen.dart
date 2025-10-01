import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Help & Support')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildSearchBar(context),
            const SizedBox(height: 24),
            _buildFAQSection(context),
            const SizedBox(height: 24),
            _buildContactSection(context),
            const SizedBox(height: 24),
            _buildTutorialSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for help topics...',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        filled: true,
        fillColor: Theme.of(context).cardColor,
      ),
    );
  }

  Widget _buildFAQSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Frequently Asked Questions',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        _buildFAQItem(
          context,
          'How do I start a game?',
          'You can start a game by tapping the Quick Play button or creating a custom game with specific settings.',
        ),
        _buildFAQItem(
          context,
          'How does the rating system work?',
          'Your rating changes based on your game results. Win against stronger players to gain more points.',
        ),
        _buildFAQItem(
          context,
          'Can I play offline?',
          'Yes, you can play against the computer without an internet connection.',
        ),
      ],
    );
  }

  Widget _buildFAQItem(BuildContext context, String question, String answer) {
    return Card(
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        children: [
          Padding(padding: const EdgeInsets.all(16.0), child: Text(answer)),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Support', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.email_outlined),
                  title: const Text('Email Support'),
                  subtitle: const Text('Get help via email'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Open email support
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.chat_outlined),
                  title: const Text('Live Chat'),
                  subtitle: const Text('Chat with support team'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Open live chat
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.forum_outlined),
                  title: const Text('Community Forum'),
                  subtitle: const Text('Get help from other players'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // TODO: Open community forum
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTutorialSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Video Tutorials', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildTutorialCard(
                context,
                'Getting Started',
                'Learn the basics of the app',
                Icons.play_circle_filled,
              ),
              _buildTutorialCard(
                context,
                'Game Modes',
                'Explore different ways to play',
                Icons.games,
              ),
              _buildTutorialCard(
                context,
                'Advanced Features',
                'Master the advanced tools',
                Icons.star,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTutorialCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: Theme.of(context).primaryColor),
            const SizedBox(height: 16),
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class QuickPlayScreen extends StatelessWidget {
  const QuickPlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quick Play')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildGameModeCard(
              context,
              'Blitz (5 min)',
              'Fast-paced 5-minute chess game',
              Icons.bolt,
              () {
                // TODO: Start 5-minute game
              },
            ),
            const SizedBox(height: 16),
            _buildGameModeCard(
              context,
              'Rapid (10 min)',
              'Standard 10-minute chess game',
              Icons.timer,
              () {
                // TODO: Start 10-minute game
              },
            ),
            const SizedBox(height: 16),
            _buildGameModeCard(
              context,
              'Classical (30 min)',
              'Traditional 30-minute chess game',
              Icons.hourglass_empty,
              () {
                // TODO: Start 30-minute game
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameModeCard(
    BuildContext context,
    String title,
    String description,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 32, color: Theme.of(context).primaryColor),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

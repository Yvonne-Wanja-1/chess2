import 'package:flutter/material.dart';

class TournamentsScreen extends StatelessWidget {
  const TournamentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tournaments')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTournamentCard(
              context,
              'Weekly Blitz Tournament',
              'Starts in 2 hours',
              '32 players',
              'Prize: 1000 points',
              () {
                // TODO: Join tournament
              },
            ),
            const SizedBox(height: 16),
            _buildTournamentCard(
              context,
              'Weekend Championship',
              'Starts tomorrow',
              '64 players',
              'Prize: 2500 points',
              () {
                // TODO: Join tournament
              },
            ),
            const SizedBox(height: 16),
            _buildTournamentCard(
              context,
              'Monthly Masters',
              'Starts in 5 days',
              '128 players',
              'Prize: 5000 points',
              () {
                // TODO: Join tournament
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Create tournament
        },
        icon: const Icon(Icons.add),
        label: const Text('Create Tournament'),
      ),
    );
  }

  Widget _buildTournamentCard(
    BuildContext context,
    String title,
    String startTime,
    String players,
    String prize,
    VoidCallback onJoin,
  ) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(startTime),
                const SizedBox(width: 16),
                const Icon(Icons.people, size: 16),
                const SizedBox(width: 4),
                Text(players),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              prize,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // TODO: View details
                  },
                  child: const Text('View Details'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: onJoin, child: const Text('Join')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

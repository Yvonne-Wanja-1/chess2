import 'package:flutter/material.dart';

class DailyPuzzleScreen extends StatefulWidget {
  const DailyPuzzleScreen({super.key});

  @override
  State<DailyPuzzleScreen> createState() => _DailyPuzzleScreenState();
}

class _DailyPuzzleScreenState extends State<DailyPuzzleScreen> {
  int _solvedPuzzles = 0;
  int _currentStreak = 0;
  int _bestStreak = 5;
  double _rating = 1200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Puzzles'),
        actions: [
          IconButton(
            icon: const Icon(Icons.diamond_outlined),
            onPressed: () {
              // TODO: Show puzzle rewards
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildStats(),
            _buildDailyPuzzle(),
            _buildPuzzleCategories(),
            _buildLeaderboard(),
          ],
        ),
      ),
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard(
            'Solved',
            _solvedPuzzles.toString(),
            Icons.check_circle_outline,
          ),
          _buildStatCard(
            'Current Streak',
            _currentStreak.toString(),
            Icons.local_fire_department_outlined,
          ),
          _buildStatCard(
            'Best Streak',
            _bestStreak.toString(),
            Icons.emoji_events_outlined,
          ),
          _buildStatCard(
            'Rating',
            _rating.toStringAsFixed(0),
            Icons.trending_up,
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Icon(icon),
            const SizedBox(height: 4),
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(title, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyPuzzle() {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 300,
            color: Colors.grey[200],
            child: const Center(child: Text('Chess Board Puzzle Here')),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Challenge',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const Text('White to move and mate in 2'),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildActionButton('Hint', Icons.lightbulb_outline),
                    _buildActionButton('Submit', Icons.check_circle_outline),
                    _buildActionButton('Solution', Icons.help_outline),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        // TODO: Implement button actions
      },
      icon: Icon(icon),
      label: Text(label),
    );
  }

  Widget _buildPuzzleCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Puzzle Categories',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              _buildCategoryCard('Endgame', '🏁', '125 puzzles'),
              _buildCategoryCard('Tactics', '⚔️', '250 puzzles'),
              _buildCategoryCard('Checkmate', '👑', '180 puzzles'),
              _buildCategoryCard('Opening', '🎯', '150 puzzles'),
              _buildCategoryCard('Defense', '🛡️', '200 puzzles'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, String emoji, String count) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to category puzzles
        },
        child: Container(
          width: 120,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 24)),
              const SizedBox(height: 8),
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(count, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Top Puzzle Solvers',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text('Player ${index + 1}'),
              subtitle: Text('Rating: ${2000 - index * 100}'),
              trailing: Text('${500 - index * 50} solved'),
            );
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class SpectatorScreen extends StatefulWidget {
  const SpectatorScreen({super.key});

  @override
  State<SpectatorScreen> createState() => _SpectatorScreenState();
}

class _SpectatorScreenState extends State<SpectatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Games'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFeaturedMatch(),
          const Divider(),
          Expanded(child: _buildLiveGamesList()),
        ],
      ),
    );
  }

  Widget _buildFeaturedMatch() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Match',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              _buildViewerCount(1234),
            ],
          ),
          const SizedBox(height: 16),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPlayerInfo(
                        'GM Magnus Carlsen',
                        'Rating: 2847',
                        Icons.person,
                      ),
                      const Text(
                        'vs',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _buildPlayerInfo(
                        'GM Alireza Firouzja',
                        'Rating: 2804',
                        Icons.person,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implement watch game
                    },
                    icon: const Icon(Icons.visibility),
                    label: const Text('Watch Game'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveGamesList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: const Text('Player 1 vs Player 2'),
            subtitle: Row(
              children: [
                const Icon(Icons.timer_outlined, size: 16),
                const SizedBox(width: 4),
                Text('${15 + index} min'),
                const SizedBox(width: 16),
                const Icon(Icons.person_outlined, size: 16),
                const SizedBox(width: 4),
                Text('${100 - index * 5} viewers'),
              ],
            ),
            trailing: IconButton(
              icon: const Icon(Icons.play_circle_outline),
              onPressed: () {
                // TODO: Implement watch game
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildPlayerInfo(String name, String rating, IconData icon) {
    return Column(
      children: [
        CircleAvatar(radius: 30, child: Icon(icon, size: 30)),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(rating, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildViewerCount(int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.visibility, color: Colors.white, size: 16),
          const SizedBox(width: 4),
          Text(
            '$count',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Games'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFilterOption('Rating Range'),
            _buildFilterOption('Time Control'),
            _buildFilterOption('Tournament Games Only'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Apply'),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterOption(String title) {
    return CheckboxListTile(
      title: Text(title),
      value: false,
      onChanged: (value) {
        // TODO: Implement filter
      },
    );
  }
}

import 'package:flutter/material.dart';

class FindPlayersScreen extends StatelessWidget {
  const FindPlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Players'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Show filter options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search players by username or rating...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Theme.of(context).cardColor,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildPlayerCard(
                  context,
                  'GrandMaster42',
                  2200,
                  'Online',
                  'assets/images/avatars/player1.png',
                  true,
                ),
                _buildPlayerCard(
                  context,
                  'ChessLover99',
                  1850,
                  'In Game',
                  'assets/images/avatars/player2.png',
                  false,
                ),
                _buildPlayerCard(
                  context,
                  'QueenMaster',
                  1975,
                  'Online',
                  'assets/images/avatars/player3.png',
                  true,
                ),
                _buildPlayerCard(
                  context,
                  'KnightRider',
                  1600,
                  'Away',
                  'assets/images/avatars/player4.png',
                  false,
                ),
                _buildPlayerCard(
                  context,
                  'PawnStar',
                  1750,
                  'Online',
                  'assets/images/avatars/player5.png',
                  true,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Open scan QR code
        },
        child: const Icon(Icons.qr_code_scanner),
      ),
    );
  }

  Widget _buildPlayerCard(
    BuildContext context,
    String username,
    int rating,
    String status,
    String avatarPath,
    bool isOnline,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Stack(
              children: [
                const CircleAvatar(radius: 30, child: Icon(Icons.person)),
                if (isOnline)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          width: 2,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    username,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Rating: $rating',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    status,
                    style: TextStyle(
                      color: isOnline ? Colors.green : Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.person_add),
                  onPressed: () {
                    // TODO: Send friend request
                  },
                  tooltip: 'Add Friend',
                ),
                IconButton(
                  icon: const Icon(Icons.sports_esports),
                  onPressed: () {
                    // TODO: Challenge to game
                  },
                  tooltip: 'Challenge',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

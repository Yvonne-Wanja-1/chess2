import 'package:flutter/material.dart';

class RoastScreen extends StatefulWidget {
  const RoastScreen({super.key});

  @override
  State<RoastScreen> createState() => _RoastScreenState();
}

class _RoastScreenState extends State<RoastScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<RoastMessage> _roasts = [
    RoastMessage(
      sender: 'ChessMaster2000',
      message: 'Your opening game is so weak, even a pawn could beat you! 😆',
      likes: 5,
    ),
    RoastMessage(
      sender: 'QueenSlayer99',
      message: 'I\'ve seen better moves in a game of tic-tac-toe! 🎯',
      likes: 12,
    ),
    RoastMessage(
      sender: 'KnightRider',
      message: 'Your endgame is like my WiFi - always disconnecting! 📶',
      likes: 8,
    ),
  ];

  final List<String> _predefinedRoasts = [
    'Your chess rating is lower than my phone battery! 🔋',
    'Even my grandma moves pieces faster than you! ⏰',
    'I\'ve seen better strategies in a game of peek-a-boo! 👀',
    'Your castle is more like a sandcastle! 🏰',
    'Your queen moves like she\'s stuck in traffic! 🚗',
  ];

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roast Arena'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => _showRoastRules(context),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildLeaderboard(context),
          Expanded(child: _buildRoastList()),
          _buildRoastInput(context),
        ],
      ),
    );
  }

  Widget _buildLeaderboard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Column(
        children: [
          Text(
            'Top Roasters 🔥',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTopRoaster('👑 ChessMaster2000', '150 likes'),
              _buildTopRoaster('🥈 QueenSlayer99', '120 likes'),
              _buildTopRoaster('🥉 KnightRider', '90 likes'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopRoaster(String name, String score) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          score,
          style: TextStyle(
            color: Theme.of(
              context,
            ).colorScheme.onPrimaryContainer.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildRoastList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _roasts.length,
      itemBuilder: (context, index) {
        final roast = _roasts[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(child: Text(roast.sender[0])),
                    const SizedBox(width: 8),
                    Text(
                      roast.sender,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  roast.message,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.local_fire_department),
                      label: Text(roast.likes.toString()),
                      onPressed: () {
                        setState(() {
                          roast.likes++;
                        });
                      },
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.reply),
                      label: const Text('Roast Back'),
                      onPressed: () {
                        _showReplyDialog(context, roast);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRoastInput(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.auto_awesome),
            onPressed: () => _showPredefinedRoasts(context),
            tooltip: 'Quick Roasts',
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your roast here...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(icon: const Icon(Icons.send), onPressed: _sendRoast),
        ],
      ),
    );
  }

  void _showRoastRules(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Roast Rules 📜'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. Keep it chess-related'),
            Text('2. No personal attacks'),
            Text('3. Keep it family-friendly'),
            Text('4. Be creative and funny'),
            Text('5. Don\'t spam'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Got it!'),
          ),
        ],
      ),
    );
  }

  void _showPredefinedRoasts(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView.builder(
        itemCount: _predefinedRoasts.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(_predefinedRoasts[index]),
          onTap: () {
            _messageController.text = _predefinedRoasts[index];
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void _showReplyDialog(BuildContext context, RoastMessage originalRoast) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Roast Back'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Replying to ${originalRoast.sender}:',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(originalRoast.message),
            const SizedBox(height: 16),
            TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Your comeback...',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              _sendRoast();
              Navigator.pop(context);
            },
            child: const Text('Send'),
          ),
        ],
      ),
    );
  }

  void _sendRoast() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _roasts.insert(
        0,
        RoastMessage(sender: 'You', message: _messageController.text, likes: 0),
      );
      _messageController.clear();
    });
  }
}

class RoastMessage {
  final String sender;
  final String message;
  int likes;

  RoastMessage({required this.sender, required this.message, this.likes = 0});
}

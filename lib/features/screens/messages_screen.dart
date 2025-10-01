import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildChatItem(
            context,
            'John Smith',
            'Good game! Let\'s play again sometime.',
            '2m ago',
            true,
            1,
          ),
          _buildChatItem(
            context,
            'Chess Club',
            'Tournament starts in 30 minutes!',
            '15m ago',
            true,
            2,
          ),
          _buildChatItem(
            context,
            'Sarah Parker',
            'Thanks for the chess tips!',
            '1h ago',
            false,
            0,
          ),
          _buildChatItem(
            context,
            'Team Chess Masters',
            'Team practice at 6 PM today',
            '3h ago',
            false,
            0,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Start new chat
        },
        child: const Icon(Icons.chat),
      ),
    );
  }

  Widget _buildChatItem(
    BuildContext context,
    String name,
    String lastMessage,
    String time,
    bool unread,
    int messageCount,
  ) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        child: Text(name[0], style: const TextStyle(color: Colors.white)),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: unread ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      subtitle: Text(
        lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: unread
              ? Theme.of(context).textTheme.bodyLarge?.color
              : Theme.of(context).textTheme.bodyMedium?.color,
        ),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: Theme.of(context).textTheme.bodySmall),
          if (messageCount > 0) ...[
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.circle,
              ),
              child: Text(
                messageCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ],
        ],
      ),
      onTap: () {
        // TODO: Navigate to chat
      },
    );
  }
}

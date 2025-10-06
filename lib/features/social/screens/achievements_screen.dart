import 'package:flutter/material.dart';
import '../models/achievement.dart';

class AchievementsScreen extends StatefulWidget {
  const AchievementsScreen({super.key});

  @override
  State<AchievementsScreen> createState() => _AchievementsScreenState();
}

class _AchievementsScreenState extends State<AchievementsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Achievements', 'Badges', 'Leaderboards'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements & Rankings'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAchievementsTab(),
          _buildBadgesTab(),
          _buildLeaderboardsTab(),
        ],
      ),
    );
  }

  Widget _buildAchievementsTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAchievementCard(
          title: 'First Victory',
          description: 'Win your first chess game',
          progress: '1/1',
          isUnlocked: true,
          points: 100,
          iconData: Icons.emoji_events,
        ),
        _buildAchievementCard(
          title: 'Opening Master',
          description: 'Play 50 different opening moves',
          progress: '23/50',
          isUnlocked: false,
          points: 250,
          iconData: Icons.auto_awesome,
        ),
        // Add more achievements
      ],
    );
  }

  Widget _buildBadgesTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 6, // Example number of badges
      itemBuilder: (context, index) {
        return _buildBadgeCard(
          name: 'Master Strategist',
          description: 'Won 100 games',
          isEquipped: index == 0,
          rarity: 'Legendary',
          iconData: Icons.military_tech,
        );
      },
    );
  }

  Widget _buildLeaderboardsTab() {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Global'),
              Tab(text: 'Friends'),
              Tab(text: 'Weekly'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildLeaderboardList('Global'),
                _buildLeaderboardList('Friends'),
                _buildLeaderboardList('Weekly'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementCard({
    required String title,
    required String description,
    required String progress,
    required bool isUnlocked,
    required int points,
    required IconData iconData,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isUnlocked
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surfaceVariant,
          child: Icon(
            iconData,
            color: isUnlocked
                ? Theme.of(context).colorScheme.onPrimary
                : Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: isUnlocked ? 1.0 : 0.5,
              backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
            ),
            const SizedBox(height: 4),
            Text(progress, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isUnlocked
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceVariant,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            '+$points',
            style: TextStyle(
              color: isUnlocked
                  ? Theme.of(context).colorScheme.onPrimary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBadgeCard({
    required String name,
    required String description,
    required bool isEquipped,
    required String rarity,
    required IconData iconData,
  }) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Implement badge equip/unequip
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Icon(iconData, size: 32, color: Colors.white),
                  ),
                  if (isEquipped)
                    const Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.green,
                        child: Icon(Icons.check, size: 16, color: Colors.white),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                rarity,
                style: TextStyle(color: _getRarityColor(rarity), fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardList(String type) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(child: Text('#${index + 1}')),
          title: Text('Player ${index + 1}'),
          subtitle: Text('Rating: ${2000 - index * 25}'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('+${300 - index * 15}'),
              const SizedBox(width: 8),
              const Icon(Icons.trending_up, color: Colors.green),
            ],
          ),
        );
      },
    );
  }

  Color _getRarityColor(String rarity) {
    switch (rarity.toLowerCase()) {
      case 'common':
        return Colors.grey;
      case 'rare':
        return Colors.blue;
      case 'epic':
        return Colors.purple;
      case 'legendary':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }
}

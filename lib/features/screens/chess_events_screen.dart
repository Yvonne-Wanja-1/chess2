import 'package:flutter/material.dart';

class ChessEventsScreen extends StatefulWidget {
  const ChessEventsScreen({super.key});

  @override
  State<ChessEventsScreen> createState() => _ChessEventsScreenState();
}

class _ChessEventsScreenState extends State<ChessEventsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = ['Upcoming', 'Live', 'Past'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events & Tournaments'),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs.map((tab) => Tab(text: tab)).toList(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterDialog(context),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUpcomingEvents(),
          _buildLiveEvents(),
          _buildPastEvents(),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: Create new tournament
        },
        icon: const Icon(Icons.add),
        label: const Text('Create Tournament'),
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildFeaturedTournament(),
        const SizedBox(height: 16),
        _buildEventsList(isUpcoming: true),
      ],
    );
  }

  Widget _buildLiveEvents() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildLiveMatches(),
        const SizedBox(height: 16),
        _buildEventsList(isLive: true),
      ],
    );
  }

  Widget _buildPastEvents() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [_buildEventsList(isPast: true)],
    );
  }

  Widget _buildFeaturedTournament() {
    return Card(
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Icon(Icons.emoji_events, size: 64, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Grand Chess Championship',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildPrizeBadge('\$5,000'),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.calendar_today, size: 16),
                    const SizedBox(width: 4),
                    const Text('Oct 15, 2025'),
                    const SizedBox(width: 16),
                    const Icon(Icons.people_outline, size: 16),
                    const SizedBox(width: 4),
                    const Text('128 players'),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Register for tournament
                  },
                  child: const Text('Register Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveMatches() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Live Matches', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        SizedBox(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(5, (index) => _buildLiveMatchCard()),
          ),
        ),
      ],
    );
  }

  Widget _buildLiveMatchCard() {
    return Card(
      margin: const EdgeInsets.only(right: 16),
      child: Container(
        width: 280,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPlayerInfo('Player 1', '2400'),
                const Text(
                  'vs',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                _buildPlayerInfo('Player 2', '2350'),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMatchStat('Round 3'),
                _buildMatchStat('15:42'),
                _buildMatchStat('1.2k viewers'),
              ],
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // TODO: Watch match
              },
              child: const Text('Watch Now'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventsList({
    bool isUpcoming = false,
    bool isLive = false,
    bool isPast = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isUpcoming
              ? 'Upcoming Tournaments'
              : isLive
              ? 'Ongoing Tournaments'
              : 'Past Tournaments',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => _buildEventCard(),
        ),
      ],
    );
  }

  Widget _buildEventCard() {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: const CircleAvatar(child: Icon(Icons.emoji_events)),
        title: const Text('Weekly Blitz Tournament'),
        subtitle: Row(
          children: [
            const Icon(Icons.calendar_today, size: 16),
            const SizedBox(width: 4),
            const Text('Oct 10'),
            const SizedBox(width: 16),
            const Icon(Icons.people_outline, size: 16),
            const SizedBox(width: 4),
            const Text('64 players'),
          ],
        ),
        trailing: _buildPrizeBadge('\$500'),
        onTap: () {
          // TODO: Show tournament details
        },
      ),
    );
  }

  Widget _buildPlayerInfo(String name, String rating) {
    return Column(
      children: [
        const CircleAvatar(radius: 20, child: Icon(Icons.person)),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(rating),
      ],
    );
  }

  Widget _buildMatchStat(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: Theme.of(context).textTheme.bodySmall),
    );
  }

  Widget _buildPrizeBadge(String prize) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        prize,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  void _showFilterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Events'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildFilterOption('Time Control'),
            _buildFilterOption('Rating Range'),
            _buildFilterOption('Entry Fee'),
            _buildFilterOption('Prize Pool'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Reset'),
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
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // TODO: Show specific filter options
      },
    );
  }
}

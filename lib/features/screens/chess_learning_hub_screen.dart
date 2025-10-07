import 'package:flutter/material.dart';

class ChessLearningHubScreen extends StatelessWidget {
  const ChessLearningHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learning Hub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {
              // TODO: Show bookmarked lessons
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFeaturedCourse(context),
            _buildLearningPaths(context),
            _buildInteractiveGuides(context),
            _buildMasterClasses(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedCourse(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: const Center(
              child: Icon(Icons.school, size: 64, color: Colors.white),
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
                      'Master the Fundamentals',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildProgressBadge(context, '70%'),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'A comprehensive guide for beginners',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _buildCourseStat(context, '12 Lessons'),
                    const SizedBox(width: 16),
                    _buildCourseStat(context, '3 Hours'),
                    const SizedBox(width: 16),
                    _buildCourseStat(context, '50+ Exercises'),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: Continue course
                  },
                  child: const Text('Continue Learning'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLearningPaths(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Learning Paths',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 180,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              _buildPathCard(
                context,
                'Beginner\'s Path',
                '🎯',
                'Start your chess journey',
                Colors.blue,
              ),
              _buildPathCard(
                context,
                'Intermediate',
                '⚡',
                'Enhance your tactics',
                Colors.orange,
              ),
              _buildPathCard(
                context,
                'Advanced',
                '🎓',
                'Master complex strategies',
                Colors.purple,
              ),
              _buildPathCard(
                context,
                'Expert',
                '👑',
                'Professional techniques',
                Colors.red,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveGuides(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Interactive Guides',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final guides = [
              {
                'title': 'Opening Principles',
                'icon': Icons.lightbulb_outline,
                'progress': 0.8,
              },
              {
                'title': 'Tactical Patterns',
                'icon': Icons.psychology_outlined,
                'progress': 0.6,
              },
              {
                'title': 'Endgame Essentials',
                'icon': Icons.sports_score_outlined,
                'progress': 0.4,
              },
              {
                'title': 'Strategic Planning',
                'icon': Icons.route_outlined,
                'progress': 0.3,
              },
            ];

            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Icon(guides[index]['icon'] as IconData),
                title: Text(guides[index]['title'] as String),
                subtitle: LinearProgressIndicator(
                  value: guides[index]['progress'] as double,
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Navigate to guide
                },
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildMasterClasses(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Master Classes',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              _buildMasterClassCard(
                context,
                'Positional Play',
                'GM John Doe',
                '2h 30m',
                Colors.indigo,
              ),
              _buildMasterClassCard(
                context,
                'Attack Techniques',
                'GM Jane Smith',
                '1h 45m',
                Colors.deepPurple,
              ),
              _buildMasterClassCard(
                context,
                'Defense Mastery',
                'GM Bob Wilson',
                '2h 15m',
                Colors.teal,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressBadge(BuildContext context, String progress) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        progress,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildCourseStat(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(text),
    );
  }

  Widget _buildPathCard(
    BuildContext context,
    String title,
    String emoji,
    String description,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      color: color,
      child: InkWell(
        onTap: () {
          // TODO: Navigate to learning path
        },
        child: Container(
          width: 160,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(color: Colors.white70, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMasterClassCard(
    BuildContext context,
    String title,
    String instructor,
    String duration,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 4),
            Text(instructor, style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, size: 16),
                const SizedBox(width: 4),
                Text(duration, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

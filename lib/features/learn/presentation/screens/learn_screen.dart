import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        // Learning Path Progress
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Learning Path',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                LinearProgressIndicator(
                  value: 0.45,
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer.withOpacity(0.3),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Level 4: Advanced Tactics',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  '45% Complete',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Course Categories
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Course Categories',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _CourseCategoryCard(
                        icon: Icons.school,
                        title: 'Basics',
                        lessonsCount: 10,
                        onTap: () {
                          // TODO: Navigate to basics
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _CourseCategoryCard(
                        icon: Icons.psychology,
                        title: 'Tactics',
                        lessonsCount: 25,
                        onTap: () {
                          // TODO: Navigate to tactics
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: _CourseCategoryCard(
                        icon: Icons.extension,
                        title: 'Strategy',
                        lessonsCount: 15,
                        onTap: () {
                          // TODO: Navigate to strategy
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _CourseCategoryCard(
                        icon: Icons.sports_score,
                        title: 'Endgame',
                        lessonsCount: 20,
                        onTap: () {
                          // TODO: Navigate to endgame
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Daily Lessons
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Daily Lessons',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                _LessonItem(
                  title: 'Pin Tactics',
                  description: 'Learn about absolute and relative pins',
                  duration: '15 mins',
                  isCompleted: true,
                  onTap: () {
                    // TODO: Navigate to lesson
                  },
                ),
                const Divider(),
                _LessonItem(
                  title: 'Fork Combinations',
                  description: 'Advanced knight fork patterns',
                  duration: '20 mins',
                  isCompleted: false,
                  onTap: () {
                    // TODO: Navigate to lesson
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CourseCategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final int lessonsCount;
  final VoidCallback onTap;

  const _CourseCategoryCard({
    required this.icon,
    required this.title,
    required this.lessonsCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, size: 32),
            const SizedBox(height: 8),
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            Text(
              '$lessonsCount Lessons',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _LessonItem extends StatelessWidget {
  final String title;
  final String description;
  final String duration;
  final bool isCompleted;
  final VoidCallback onTap;

  const _LessonItem({
    required this.title,
    required this.description,
    required this.duration,
    required this.isCompleted,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isCompleted ? Icons.check_circle : Icons.play_circle_outline,
        color: isCompleted
            ? Colors.green
            : Theme.of(context).colorScheme.primary,
        size: 32,
      ),
      title: Text(title),
      subtitle: Text('$description • $duration'),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

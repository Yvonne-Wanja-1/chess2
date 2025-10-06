import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaScreen extends StatelessWidget {
  const SocialMediaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social Connect')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildShareCard(context),
            const SizedBox(height: 16),
            _buildSocialConnectSection(context),
            const SizedBox(height: 16),
            _buildCommunitySection(context),
            const SizedBox(height: 16),
            _buildShareAchievement(context),
          ],
        ),
      ),
    );
  }

  Widget _buildShareCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).primaryColor,
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Share Your Game',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Text(
                        'Let your friends know about your chess journey!',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSocialButton(
                  context,
                  'X (Twitter)',
                  Icons.flutter_dash,
                  Colors.black,
                  () => _shareToTwitter(context),
                ),
                _buildSocialButton(
                  context,
                  'Instagram',
                  Icons.camera_alt,
                  Colors.purple,
                  () => _shareToInstagram(context),
                ),
                _buildSocialButton(
                  context,
                  'WhatsApp',
                  Icons.whatsapp,
                  Colors.green,
                  () => _shareToWhatsApp(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialConnectSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Connect with Us',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 8),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _buildSocialLink(
                context,
                'Follow us on X (Twitter)',
                Icons.flutter_dash,
                '@ChessdUp',
                () => _launchURL('https://twitter.com/chessdUp'),
              ),
              const Divider(),
              _buildSocialLink(
                context,
                'Follow us on Instagram',
                Icons.camera_alt,
                '@chessdUp',
                () => _launchURL('https://instagram.com/chessdUp'),
              ),
              const Divider(),
              _buildSocialLink(
                context,
                'Join WhatsApp Community',
                Icons.whatsapp,
                'Chess\'d Up Community',
                () => _launchURL('https://whatsapp.com/group/chessdUp'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCommunitySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Community Highlights',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            children: [
              _buildCommunityPost(
                context,
                'assets/images/highlights/tournament.jpg',
                'Weekend Tournament Winners! 🏆',
                '256 likes',
              ),
              _buildCommunityPost(
                context,
                'assets/images/highlights/training.jpg',
                'Master Class Session 📚',
                '189 likes',
              ),
              _buildCommunityPost(
                context,
                'assets/images/highlights/match.jpg',
                'Epic Match of the Week! ⚔️',
                '324 likes',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildShareAchievement(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Share Your Achievement',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            TextField(
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'What\'s your latest chess accomplishment?',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () => _shareCustomAchievement(context),
              icon: const Icon(Icons.share),
              label: const Text('Share to All Platforms'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color.withOpacity(0.1),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 4),
          Text(title, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _buildSocialLink(
    BuildContext context,
    String title,
    IconData icon,
    String handle,
    VoidCallback onPressed,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(handle),
      trailing: TextButton(onPressed: onPressed, child: const Text('FOLLOW')),
    );
  }

  Widget _buildCommunityPost(
    BuildContext context,
    String image,
    String title,
    String likes,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 200,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Icon(Icons.photo, size: 40)),
            ),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(likes, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error
      debugPrint('Could not launch $url');
    }
  }

  void _shareToTwitter(BuildContext context) {
    // Implement Twitter sharing
    _showShareDialog(context, 'X (Twitter)');
  }

  void _shareToInstagram(BuildContext context) {
    // Implement Instagram sharing
    _showShareDialog(context, 'Instagram');
  }

  void _shareToWhatsApp(BuildContext context) {
    // Implement WhatsApp sharing
    _showShareDialog(context, 'WhatsApp');
  }

  void _shareCustomAchievement(BuildContext context) {
    // Implement multi-platform sharing
    _showShareDialog(context, 'All Platforms');
  }

  void _showShareDialog(BuildContext context, String platform) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Share to $platform'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text('Preparing to share to $platform...'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }
}

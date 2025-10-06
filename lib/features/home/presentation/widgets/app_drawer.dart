import 'package:flutter/material.dart';
import '../../../../shared/widgets/pawn_icon.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildPlaySection(context),
                _buildCompetitionSection(context),
                _buildSocialSection(context),
                const Divider(),
                _buildSettingsSection(context),
              ],
            ),
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      currentAccountPicture: const CircleAvatar(
        radius: 40,
        backgroundColor: Colors.white,
        backgroundImage: AssetImage('assets/images/default_avatar.png'),
      ),
      accountName: Text(
        'Guest User',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
      accountEmail: Row(
        children: [
          Icon(
            Icons.emoji_events,
            size: 16,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          const SizedBox(width: 8),
          Text(
            'Rating: 1200',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      otherAccountsPictures: [
        IconButton(
          icon: const Icon(Icons.edit),
          color: Theme.of(context).colorScheme.onPrimary,
          onPressed: () {
            // TODO: Navigate to profile edit
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  Widget _buildPlaySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'PLAY',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: const PawnIcon(),
          title: const Text('Quick Play'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/quick-play');
          },
        ),
        ListTile(
          leading: const PawnIcon(),
          title: const Text('Custom Game'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/custom-game');
          },
        ),
      ],
    );
  }

  Widget _buildCompetitionSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'COMPETE',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.emoji_events_outlined),
          title: const Text('Tournaments'),
          trailing: _buildNewBadge(context),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/tournaments');
          },
        ),
        ListTile(
          leading: const Icon(Icons.school_outlined),
          title: const Text('Training'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/training');
          },
        ),
        ListTile(
          leading: const Icon(Icons.analytics_outlined),
          title: const Text('Stats & Analysis'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/stats');
          },
        ),
      ],
    );
  }

  Widget _buildSocialSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            'SOCIAL',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.groups_outlined),
          title: const Text('Teams'),
          trailing: _buildNewBadge(context),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/teams');
          },
        ),
        ListTile(
          leading: const Icon(Icons.person_add_outlined),
          title: const Text('Find Players'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/find-players');
          },
        ),
        ListTile(
          leading: const Icon(Icons.chat_outlined),
          title: const Text('Messages'),
          trailing: _buildMessageCount(context, 3),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/messages');
          },
        ),
        ListTile(
          leading: const Icon(Icons.emoji_emotions_outlined),
          title: const Text('Roast Arena'),
          trailing: _buildNewBadge(context),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/roast');
          },
        ),
        ListTile(
          leading: const Icon(Icons.share_outlined),
          title: const Text('Social Connect'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/social');
          },
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/settings');
          },
        ),
        ListTile(
          leading: const Icon(Icons.help_outline),
          title: const Text('Help & Support'),
          onTap: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, '/help');
          },
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // TODO: Show language selector
            },
            tooltip: 'Change Language',
          ),
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              // TODO: Toggle theme
            },
            tooltip: 'Toggle Theme',
          ),
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              // TODO: Show app info
            },
            tooltip: 'App Info',
          ),
        ],
      ),
    );
  }

  Widget _buildNewBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'NEW',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMessageCount(BuildContext context, int count) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Text(
        count.toString(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

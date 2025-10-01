import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _soundEnabled = true;
  String _selectedTheme = 'system';
  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        children: [
          _buildSection('General', [
            _buildThemeSelector(context),
            _buildLanguageSelector(context),
            SwitchListTile(
              title: const Text('Notifications'),
              subtitle: const Text('Receive game and social notifications'),
              value: _notificationsEnabled,
              onChanged: (bool value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Sound Effects'),
              subtitle: const Text('Play sounds during the game'),
              value: _soundEnabled,
              onChanged: (bool value) {
                setState(() {
                  _soundEnabled = value;
                });
              },
            ),
          ]),
          _buildSection('Game Settings', [
            ListTile(
              title: const Text('Board Style'),
              subtitle: const Text('Customize the chess board appearance'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to board style settings
              },
            ),
            ListTile(
              title: const Text('Piece Style'),
              subtitle: const Text('Choose your preferred piece design'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to piece style settings
              },
            ),
          ]),
          _buildSection('Account', [
            ListTile(
              title: const Text('Profile'),
              subtitle: const Text('Edit your profile information'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to profile settings
              },
            ),
            ListTile(
              title: const Text('Privacy'),
              subtitle: const Text('Manage your privacy settings'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Navigate to privacy settings
              },
            ),
          ]),
          _buildSection('About', [
            ListTile(
              title: const Text('Version'),
              subtitle: const Text('1.0.0'),
            ),
            ListTile(
              title: const Text('Terms of Service'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Show terms of service
              },
            ),
            ListTile(
              title: const Text('Privacy Policy'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // TODO: Show privacy policy
              },
            ),
          ]),
          ListTile(
            title: Text(
              'Sign Out',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).colorScheme.error,
            ),
            onTap: () {
              // TODO: Implement sign out
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...children,
        const Divider(),
      ],
    );
  }

  Widget _buildThemeSelector(BuildContext context) {
    return ListTile(
      title: const Text('Theme'),
      subtitle: Text(_getThemeDisplayName(_selectedTheme)),
      trailing: DropdownButton<String>(
        value: _selectedTheme,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedTheme = newValue;
            });
          }
        },
        items: ['system', 'light', 'dark'].map<DropdownMenuItem<String>>((
          String value,
        ) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(_getThemeDisplayName(value)),
          );
        }).toList(),
      ),
    );
  }

  String _getThemeDisplayName(String theme) {
    switch (theme) {
      case 'system':
        return 'System Default';
      case 'light':
        return 'Light';
      case 'dark':
        return 'Dark';
      default:
        return '';
    }
  }

  Widget _buildLanguageSelector(BuildContext context) {
    return ListTile(
      title: const Text('Language'),
      subtitle: Text(_selectedLanguage),
      trailing: DropdownButton<String>(
        value: _selectedLanguage,
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _selectedLanguage = newValue;
            });
          }
        },
        items: ['English', 'Español', 'Français', 'Deutsch']
            .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            })
            .toList(),
      ),
    );
  }
}

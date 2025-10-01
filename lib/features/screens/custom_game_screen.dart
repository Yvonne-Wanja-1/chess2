import 'package:flutter/material.dart';
import './game_screen.dart';

class CustomGameScreen extends StatefulWidget {
  const CustomGameScreen({super.key});

  @override
  State<CustomGameScreen> createState() => _CustomGameScreenState();
}

class _CustomGameScreenState extends State<CustomGameScreen> {
  String _selectedMode = 'Standard';
  double _initialTime = 30;
  double _increment = 10;
  String _selectedOpponent = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Game')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildGameModeSection(context),
            const SizedBox(height: 24),
            _buildTimeControlSection(context),
            const SizedBox(height: 24),
            _buildOpponentSection(context),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                if (_selectedOpponent.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an opponent type'),
                    ),
                  );
                  return;
                }
                _startGame(context, _selectedOpponent);
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('Start Game', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGameModeSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Game Mode', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                _buildRadioTile(
                  context,
                  'Standard',
                  'Classical chess rules',
                  Icons.casino,
                  _selectedMode == 'Standard',
                  (val) {
                    setState(() {
                      _selectedMode = 'Standard';
                    });
                  },
                ),
                _buildRadioTile(
                  context,
                  'Fischer Random',
                  'Random piece placement',
                  Icons.shuffle,
                  _selectedMode == 'Fischer Random',
                  (val) {
                    setState(() {
                      _selectedMode = 'Fischer Random';
                    });
                  },
                ),
                _buildRadioTile(
                  context,
                  'Crazyhouse',
                  'Captured pieces can be dropped back',
                  Icons.style,
                  _selectedMode == 'Crazyhouse',
                  (val) {
                    setState(() {
                      _selectedMode = 'Crazyhouse';
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeControlSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Time Control', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildSliderWithLabel(
                  context,
                  'Initial Time (minutes)',
                  _initialTime,
                  1,
                  60,
                  (value) {
                    setState(() {
                      _initialTime = value;
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildSliderWithLabel(
                  context,
                  'Increment (seconds)',
                  _increment,
                  0,
                  30,
                  (value) {
                    setState(() {
                      _increment = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOpponentSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Opponent', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 16),
        Card(
          child: Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.computer, color: Colors.white),
                ),
                title: const Text('Computer'),
                subtitle: const Text('Play against AI'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  setState(() {
                    _selectedOpponent = 'computer';
                  });
                  _startGame(context, 'Computer');
                },
                selected: _selectedOpponent == 'computer',
              ),
              const Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person_add, color: Colors.white),
                ),
                title: const Text('Invite Friend'),
                subtitle: const Text('Play with a friend'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  setState(() {
                    _selectedOpponent = 'friend';
                  });
                  _showInviteFriendDialog(context);
                },
                selected: _selectedOpponent == 'friend',
              ),
              const Divider(),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.public, color: Colors.white),
                ),
                title: const Text('Open Challenge'),
                subtitle: const Text('Anyone can join'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  setState(() {
                    _selectedOpponent = 'open';
                  });
                  _startGame(context, 'Open Challenge');
                },
                selected: _selectedOpponent == 'open',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadioTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    bool selected,
    Function(bool?) onChanged,
  ) {
    return RadioListTile<bool>(
      title: Text(title),
      subtitle: Text(subtitle),
      secondary: Icon(icon),
      value: true,
      groupValue: selected,
      onChanged: onChanged,
    );
  }

  void _showInviteFriendDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Invite Friend'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Friend\'s Username',
                hintText: 'Enter username',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Game Settings',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              'Mode: $_selectedMode\nTime: ${_initialTime.toInt()} min + ${_increment.toInt()} sec',
              textAlign: TextAlign.center,
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
              Navigator.pop(context);
              _startGame(context, 'Friend');
            },
            child: const Text('Send Invite'),
          ),
        ],
      ),
    );
  }

  void _startGame(BuildContext context, String opponentType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GameScreen(
          gameMode: _selectedMode,
          timeControl: _initialTime.toInt(),
        ),
      ),
    );
  }

  Widget _buildSliderWithLabel(
    BuildContext context,
    String label,
    double value,
    double min,
    double max,
    Function(double) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Row(
          children: [
            Expanded(
              child: Slider(
                value: value,
                min: min,
                max: max,
                divisions: max.toInt(),
                label: value.toInt().toString(),
                onChanged: onChanged,
              ),
            ),
            SizedBox(
              width: 50,
              child: Text(
                value.toInt().toString(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

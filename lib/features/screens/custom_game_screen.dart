import 'package:flutter/material.dart';

class CustomGameScreen extends StatelessWidget {
  const CustomGameScreen({super.key});

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
                // TODO: Start custom game
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
                  true,
                  (val) {},
                ),
                _buildRadioTile(
                  context,
                  'Fischer Random',
                  'Random piece placement',
                  Icons.shuffle,
                  false,
                  (val) {},
                ),
                _buildRadioTile(
                  context,
                  'Crazyhouse',
                  'Captured pieces can be dropped back',
                  Icons.style,
                  false,
                  (val) {},
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
                  30,
                  1,
                  60,
                  (value) {},
                ),
                const SizedBox(height: 16),
                _buildSliderWithLabel(
                  context,
                  'Increment (seconds)',
                  10,
                  0,
                  30,
                  (value) {},
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
                onTap: () {},
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
                onTap: () {},
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
                onTap: () {},
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

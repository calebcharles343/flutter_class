import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Navigation'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.info), text: 'Info'),
            Tab(icon: Icon(Icons.settings), text: 'Settings'),
            Tab(icon: Icon(Icons.history), text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [_InfoTab(), _SettingsTab(), _HistoryTab()],
      ),
    );
  }
}

class _InfoTab extends StatelessWidget {
  const _InfoTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'App Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  'This is a Flutter learning app demonstrating various UI components and navigation patterns.',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Features',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                _buildFeatureItem('Layout Components'),
                _buildFeatureItem('Navigation Patterns'),
                _buildFeatureItem('Animation Examples'),
                _buildFeatureItem('Gesture Handling'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green.shade700, size: 20),
          const SizedBox(width: 10),
          Text(text),
        ],
      ),
    );
  }
}

class _SettingsTab extends StatelessWidget {
  const _SettingsTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Text(
          'Settings',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        _buildSettingItem('Notifications', true),
        _buildSettingItem('Dark Mode', false),
        _buildSettingItem('Auto-save', true),
        _buildSettingItem('Sync Data', false),
        const SizedBox(height: 30),
        ElevatedButton(onPressed: () {}, child: const Text('Save Settings')),
        const SizedBox(height: 10),
        OutlinedButton(onPressed: () {}, child: const Text('Reset to Default')),
      ],
    );
  }

  Widget _buildSettingItem(String title, bool value) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: Switch(value: value, onChanged: (newValue) {}),
      ),
    );
  }
}

class _HistoryTab extends StatelessWidget {
  const _HistoryTab();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Activity ${index + 1}'),
            subtitle: Text(
              '${DateTime.now().subtract(Duration(hours: index))}',
            ),
            trailing: const Icon(Icons.chevron_right),
          ),
        );
      },
    );
  }
}

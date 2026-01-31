import 'package:flutter/material.dart';

class HeroAnimationScreen extends StatelessWidget {
  const HeroAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Hero Animations',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            'Tap on any item to see Hero animation',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 30),

          // Grid of Hero items
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              _HeroItem(
                tag: 'hero1',
                color: Colors.blue,
                title: 'Flutter Logo',
                icon: Icons.flutter_dash,
              ),
              _HeroItem(
                tag: 'hero2',
                color: Colors.green,
                title: 'Settings',
                icon: Icons.settings,
              ),
              _HeroItem(
                tag: 'hero3',
                color: Colors.orange,
                title: 'Profile',
                icon: Icons.person,
              ),
              _HeroItem(
                tag: 'hero4',
                color: Colors.purple,
                title: 'Dashboard',
                icon: Icons.dashboard,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroItem extends StatelessWidget {
  final String tag;
  final Color color;
  final String title;
  final IconData icon;

  const _HeroItem({
    required this.tag,
    required this.color,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => _HeroDetailScreen(
              tag: tag,
              color: color,
              title: title,
              icon: icon,
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: tag,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: color,
                child: Icon(icon, color: Colors.white, size: 40),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeroDetailScreen extends StatelessWidget {
  final String tag;
  final Color color;
  final String title;
  final IconData icon;

  const _HeroDetailScreen({
    required this.tag,
    required this.color,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: tag,
              child: CircleAvatar(
                radius: 100,
                backgroundColor: color,
                child: Icon(icon, color: Colors.white, size: 80),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'This screen demonstrates Hero animation. Notice how the icon smoothly transitions between screens.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

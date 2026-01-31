import 'package:flutter/material.dart';

class GestureDetectorScreen extends StatefulWidget {
  const GestureDetectorScreen({super.key});

  @override
  State<GestureDetectorScreen> createState() => _GestureDetectorScreenState();
}

class _GestureDetectorScreenState extends State<GestureDetectorScreen> {
  String _lastGesture = 'Tap me!';
  Color _boxColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gesture Detector')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_lastGesture, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                setState(() {
                  _lastGesture = 'Tapped!';
                  _boxColor = Colors.green;
                });
              },
              onDoubleTap: () {
                setState(() {
                  _lastGesture = 'Double Tapped!';
                  _boxColor = Colors.orange;
                });
              },
              onLongPress: () {
                setState(() {
                  _lastGesture = 'Long Pressed!';
                  _boxColor = Colors.red;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 150,
                height: 150,
                color: _boxColor,
                child: const Center(
                  child: Text(
                    'Try:\n• Tap\n• Double Tap\n• Long Press',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

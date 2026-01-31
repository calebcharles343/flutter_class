import 'package:flutter/material.dart';

class TapScreen extends StatefulWidget {
  const TapScreen({super.key});

  @override
  State<TapScreen> createState() => _TapScreenState();
}

class _TapScreenState extends State<TapScreen> {
  int _tapCount = 0;
  int _doubleTapCount = 0;
  int _longPressCount = 0;
  Color _currentColor = Colors.blue;

  void _handleTap() {
    setState(() {
      _tapCount++;
      _currentColor = Colors.green;
    });
  }

  void _handleDoubleTap() {
    setState(() {
      _doubleTapCount++;
      _currentColor = Colors.orange;
    });
  }

  void _handleLongPress() {
    setState(() {
      _longPressCount++;
      _currentColor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tap Variations')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Stats
            const Text(
              'Try different tap gestures:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCounterBox('Tap', _tapCount, Colors.green),
                _buildCounterBox('Double Tap', _doubleTapCount, Colors.orange),
                _buildCounterBox('Long Press', _longPressCount, Colors.red),
              ],
            ),

            const SizedBox(height: 50),

            // Interactive box
            GestureDetector(
              onTap: _handleTap,
              onDoubleTap: _handleDoubleTap,
              onLongPress: _handleLongPress,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: _currentColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: _currentColor.withOpacity(0.5),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.touch_app, size: 50, color: Colors.white),
                      SizedBox(height: 10),
                      Text(
                        'Tap Here!\n\n• Single Tap\n• Double Tap\n• Long Press',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Reset button
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _tapCount = 0;
                  _doubleTapCount = 0;
                  _longPressCount = 0;
                  _currentColor = Colors.blue;
                });
              },
              child: const Text('Reset Counters'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCounterBox(String label, int count, Color color) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}

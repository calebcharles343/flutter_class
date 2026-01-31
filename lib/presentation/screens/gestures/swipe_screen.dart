import 'package:flutter/material.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  String _swipeDirection = 'Swipe here →';
  Color _swipeColor = Colors.blue;
  double _offsetX = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipe Gesture')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_swipeDirection, style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 50),
            GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _offsetX += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                setState(() {
                  if (details.primaryVelocity! > 0) {
                    _swipeDirection = 'Swiped Right →';
                    _swipeColor = Colors.green;
                  } else if (details.primaryVelocity! < 0) {
                    _swipeDirection = 'Swiped Left ←';
                    _swipeColor = Colors.red;
                  }
                  _offsetX = 0;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.translationValues(_offsetX, 0, 0),
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  color: _swipeColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                  child: Text(
                    'Swipe Left or Right',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Try vertical swipe too:'),
            GestureDetector(
              onVerticalDragEnd: (details) {
                setState(() {
                  if (details.primaryVelocity! > 0) {
                    _swipeDirection = 'Swiped Down ↓';
                    _swipeColor = Colors.purple;
                  } else if (details.primaryVelocity! < 0) {
                    _swipeDirection = 'Swiped Up ↑';
                    _swipeColor = Colors.orange;
                  }
                });
              },
              child: Container(
                width: 200,
                height: 100,
                color: Colors.grey[300],
                child: const Center(child: Text('Swipe Up or Down')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DragScreen extends StatefulWidget {
  const DragScreen({super.key});

  @override
  State<DragScreen> createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  double _positionX = 0;
  double _positionY = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Drag Gesture')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Drag the blue square around'),
            const SizedBox(height: 30),
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _positionX += details.delta.dx;
                  _positionY += details.delta.dy;
                });
              },
              child: Transform.translate(
                offset: Offset(_positionX, _positionY),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: const Icon(Icons.drag_handle, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

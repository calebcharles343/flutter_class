import 'package:flutter/material.dart';

class ScaleScreen extends StatefulWidget {
  const ScaleScreen({super.key});

  @override
  State<ScaleScreen> createState() => _ScaleScreenState();
}

class _ScaleScreenState extends State<ScaleScreen> {
  double _scale = 1.0;
  double _previousScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scale Gesture')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Pinch to zoom in/out'),
            const SizedBox(height: 30),
            GestureDetector(
              onScaleStart: (details) {
                _previousScale = _scale;
              },
              onScaleUpdate: (details) {
                setState(() {
                  _scale = _previousScale * details.scale;
                });
              },
              child: Transform.scale(
                scale: _scale,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      image: NetworkImage('https://picsum.photos/200'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Scale: ${_scale.toStringAsFixed(2)}x',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Slider(
              value: _scale,
              min: 0.1,
              max: 3.0,
              onChanged: (value) {
                setState(() {
                  _scale = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _scale = 1.0;
                });
              },
              child: const Text('Reset to 1.0x'),
            ),
          ],
        ),
      ),
    );
  }
}

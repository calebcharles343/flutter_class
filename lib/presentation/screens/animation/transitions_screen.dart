import 'package:flutter/material.dart';

class TransitionsScreen extends StatefulWidget {
  const TransitionsScreen({super.key});

  @override
  State<TransitionsScreen> createState() => _TransitionsScreenState();
}

class _TransitionsScreenState extends State<TransitionsScreen> {
  bool _showFadeTransition = false;
  bool _showScaleTransition = false;
  bool _showRotationTransition = false;
  bool _showSlideTransition = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Transitions')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Flutter Transitions',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Tap the buttons to see different transition effects',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),

            // Fade Transition
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Fade Transition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedCrossFade(
                      duration: const Duration(milliseconds: 500),
                      crossFadeState: _showFadeTransition
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      firstChild: Container(
                        width: 200,
                        height: 150,
                        color: Colors.blue,
                        child: const Center(
                          child: Text(
                            'Faded In',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                      secondChild: Container(
                        width: 200,
                        height: 150,
                        color: Colors.grey.shade300,
                        child: const Center(
                          child: Text(
                            'Faded Out',
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showFadeTransition = !_showFadeTransition;
                        });
                      },
                      child: Text(_showFadeTransition ? 'Fade Out' : 'Fade In'),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Scale Transition
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Scale Transition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedScale(
                      duration: const Duration(milliseconds: 500),
                      scale: _showScaleTransition ? 1.5 : 1.0,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.zoom_in,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showScaleTransition = !_showScaleTransition;
                        });
                      },
                      child: Text(
                        _showScaleTransition ? 'Scale Down' : 'Scale Up',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Rotation Transition
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Rotation Transition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedRotation(
                      duration: const Duration(milliseconds: 500),
                      turns: _showRotationTransition ? 0.25 : 0,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(75),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.rotate_right,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showRotationTransition = !_showRotationTransition;
                        });
                      },
                      child: Text(
                        _showRotationTransition ? 'Rotate Back' : 'Rotate 90°',
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Slide Transition
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Slide Transition',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedSlide(
                      duration: const Duration(milliseconds: 500),
                      offset: _showSlideTransition
                          ? const Offset(0.5, 0)
                          : const Offset(0, 0),
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _showSlideTransition = !_showSlideTransition;
                        });
                      },
                      child: Text(
                        _showSlideTransition ? 'Slide Back' : 'Slide Right',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

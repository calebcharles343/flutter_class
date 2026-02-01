import 'package:flutter/material.dart';

class PointerScreen extends StatefulWidget {
  const PointerScreen({super.key});

  @override
  State<PointerScreen> createState() => _PointerScreenState();
}

class _PointerScreenState extends State<PointerScreen> {
  Offset _pointerPosition = Offset.zero;
  bool _isPointerDown = false;
  String _eventType = 'No events yet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Pointer Events')),
      body: Listener(
        onPointerDown: (details) {
          setState(() {
            _isPointerDown = true;
            _pointerPosition = details.localPosition;
            _eventType = 'Pointer Down';
          });
        },
        onPointerMove: (details) {
          setState(() {
            _pointerPosition = details.localPosition;
            _eventType = 'Pointer Moving';
          });
        },
        onPointerUp: (details) {
          setState(() {
            _isPointerDown = false;
            _eventType = 'Pointer Up';
          });
        },
        child: Container(
          color: Colors.grey[200],
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                left: _pointerPosition.dx - 25,
                top: _pointerPosition.dy - 25,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: _isPointerDown ? Colors.red : Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.circle,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    _eventType,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Position: (${_pointerPosition.dx.toStringAsFixed(1)}, '
                    '${_pointerPosition.dy.toStringAsFixed(1)})',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

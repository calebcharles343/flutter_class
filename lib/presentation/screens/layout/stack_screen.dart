import 'package:flutter/material.dart';

class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final boxes = [
      Box(
        id: 1,
        name: "box 1",
        width: 350,
        height: 350,
        color: Colors.deepPurple.shade700,
      ),
      Box(
        id: 2,
        name: "box 2",
        width: 250,
        height: 250,
        color: Colors.deepPurple.shade500,
      ),
      Box(
        id: 3,
        name: "box 3",
        width: 150,
        height: 150,
        color: Colors.deepPurple.shade300,
      ),
    ];

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepPurple.shade100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: boxes.map((box) {
          return Container(
            width: box.width,
            height: box.height,
            color: box.color,
            child: Center(
              child: Text(
                box.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }).toList(), // Add .toList() here
      ),
    );
  }
}

class Box {
  final int id;
  final String name;
  final double? width;
  final double? height;
  final Color color;
  final bool? expanded;
  final int? flexCount;

  Box({
    required this.id,
    required this.name,
    this.width,
    this.height,
    required this.color,
    this.expanded,
    this.flexCount,
  });
}

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade200,
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(24),

            child: Row(
              children: [
                Icon(Icons.book, color: Colors.white, size: 64),
                Text(
                  "Flutter Class",
                  style: TextStyle(fontSize: 32, color: Colors.grey.shade100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

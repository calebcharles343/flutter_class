import 'package:flutter/material.dart';
import 'package:flutter_class1/presentation/screens/navigation/drawer_screen.dart';

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

            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.book, color: Colors.white, size: 64),
                    Text(
                      "Flutter Class",
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ],
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DrawerScreen()),
                    );
                  },
                  child: Text("Go to Drawer Navigation"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

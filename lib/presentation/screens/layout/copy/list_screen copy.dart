// ignore_for_file: file_names

/*
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  // This mimics API response structure
  final List<Map<String, dynamic>> apiResponse = const [
    {
      "userId": 1,
      "name": "John Doe",
      "email": "john@example.com",
      "avatarColor": 0xFF4285F4,
      "isActive": true,
    },
    {
      "userId": 2,
      "name": "Jane Smith",
      "email": "jane@example.com",
      "avatarColor": 0xFFEA4335,
      "isActive": false,
    },
    {
      "userId": 3,
      "name": "Bob Johnson",
      "email": "bob@example.com",
      "avatarColor": 0xFF34A853,
      "isActive": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Convert API data to model objects (common in real apps)
    final users = apiResponse.map((json) => User.fromJson(json)).toList();

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      body: ListView(
        children: users.map((user) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(user.avatarColor),
              child: Text(
                user.name[0],
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
            trailing: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: user.isActive ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
              ),
            ),
            onTap: () {
              // Handle tap (like navigation)
            },
          );
        }).toList(),
      ),
    );
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final int avatarColor;
  final bool isActive;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarColor,
    required this.isActive,
  });

  // Factory constructor to parse JSON (like from API)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userId'],
      name: json['name'],
      email: json['email'],
      avatarColor: json['avatarColor'],
      isActive: json['isActive'],
    );
  }
}
*/

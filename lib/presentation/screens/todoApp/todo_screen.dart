import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  //Text editing controller
  TextEditingController myController = TextEditingController();

  //Greet message
  String greetingMassage = "";

  //Greet User Method
  void greetUser() {
    String userName = myController.text;
    setState(() {
      greetingMassage = "🙋‍♂️..Hello, " + userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(greetingMassage),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  hintText: "Type in your name",
                ),
              ),
            ),
            ElevatedButton(onPressed: greetUser, child: Text("Tap")),
          ],
        ),
      ),
    );
  }
}

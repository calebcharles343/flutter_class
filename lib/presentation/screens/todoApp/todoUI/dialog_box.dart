import 'package:flutter/material.dart';
import 'package:flutter_class1/presentation/screens/todoApp/todoUI/todo_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber.shade300,
      content: Container(
        height: 120,
        // width: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Add new task",
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TodoButton(
                  name: "Save",
                  onPressed: onSave,
                  leadingIcon: Icon(Icons.save),
                ),
                TodoButton(
                  name: "Cancel",
                  onPressed: onCancel,
                  backgroundColor: Colors.red.shade700,
                  leadingIcon: Icon(Icons.cancel),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

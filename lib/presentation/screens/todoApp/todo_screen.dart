// lib/presentation/screens/todoApp/todo_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_class1/data/database.dart';
import 'package:flutter_class1/presentation/screens/todoApp/todoUI/dialog_box.dart';
import 'package:flutter_class1/presentation/screens/todoApp/todoUI/todo_tile.dart';

/// 🎓 LEARNING: StatefulWidget vs StatelessWidget
/// StatefulWidget: Can change over time (like this screen with todos)
/// StatelessWidget: Never changes (like a static button)
class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  // 🎓 LEARNING: Instance of our database class
  // 'late' means we'll initialize it later in initState()
  late TodoDataBase db;

  // 🎓 LEARNING: TextEditingController manages text field input
  final _taskController = TextEditingController();

  // 🎓 LEARNING: Track loading state
  bool _isLoading = true;

  /// 🎓 LEARNING: initState() is called ONCE when widget is created
  /// Perfect for initialization tasks like loading data
  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  /// 🎓 LEARNING: Initialize database asynchronously
  Future<void> _initializeDatabase() async {
    print("🔄 Loading todo database...");

    // Create database instance
    db = TodoDataBase();

    // Initialize (loads data from storage)
    await db.init();

    // 🎓 LEARNING: setState() tells Flutter to rebuild the widget
    // This changes _isLoading to false and shows the todo list
    setState(() {
      _isLoading = false;
    });

    print("✅ Database ready with ${db.todos.length} todos");
  }

  /// 🎓 LEARNING: Handle checkbox state changes
  void _toggleTaskCompletion(int index, bool? newValue) {
    setState(() {
      db.toggleTask(index, newValue ?? false);
    });
  }

  /// 🎓 LEARNING: Save new task from dialog
  void _saveNewTask() {
    final taskName = _taskController.text.trim();

    if (taskName.isNotEmpty) {
      setState(() {
        db.addTask(taskName);
        _taskController.clear(); // Clear text field
      });
    }

    // Close the dialog
    Navigator.of(context).pop();
  }

  /// 🎓 LEARNING: Show "Add Task" dialog
  void _showAddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _taskController,
          onSave: _saveNewTask,
          onCancel: () {
            _taskController.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  /// 🎓 LEARNING: Delete a task
  void _deleteTask(int index) {
    setState(() {
      db.deleteTask(index);
    });
  }

  /// 🎓 LEARNING: dispose() is called when widget is destroyed
  /// Perfect for cleanup (closing controllers, databases, etc.)
  /*
  @override
  void dispose() {
    _taskController.dispose(); // Always dispose controllers!
    db.close(); // Close database connection
    super.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    // 🎓 LEARNING: Show loading indicator while data loads
    if (_isLoading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // Loading spinner
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        backgroundColor: Colors.amber,
        elevation: 4, // Shadow under app bar
      ),

      // 🎓 LEARNING: FloatingActionButton for adding tasks
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTaskDialog,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add, size: 30),
        tooltip: 'Add new task', // Accessibility hint
      ),

      // 🎓 LEARNING: Conditional rendering based on data
      body: db.todos.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.checklist, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'No tasks yet!\nTap + to add your first task',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: db.todos.length,
              itemBuilder: (context, index) {
                // 🎓 LEARNING: Builder creates widgets on-demand
                // More efficient than creating all widgets at once
                return TodoTile(
                  taskName: db.todos[index]["taskName"] as String,
                  isTaskCompleted: db.todos[index]["isCompleted"] as bool,
                  onChanged: (value) => _toggleTaskCompletion(index, value),
                  deletefunction: (context) => _deleteTask(index),
                );
              },
            ),
    );
  }
}

// lib/data/database.dart
import 'dart:typed_data'; // ✅ Add this for Uint8List
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// 🎓 LEARNING: This class manages all database operations
/// It follows the Repository Pattern - separates data logic from UI
class TodoDataBase {
  // 🗄️ Private field to store Hive box reference
  late Box _myBox;

  // 📋 Public list that UI can access directly
  List<Map<String, dynamic>> todos = [];

  // 🚫 Track if database is initialized
  bool _isInitialized = false;

  /// 🎓 LEARNING: Initialize database (called once when app starts)
  /// This is an asynchronous method (returns Future) because it waits for:
  /// 1. File system access (getting app directory)
  /// 2. Database file opening
  Future<void> init() async {
    // Prevent multiple initializations
    if (!_isInitialized) {
      await _initializeHive();
      await _loadData();
      _isInitialized = true;
    }
  }

  /// 🎓 LEARNING: Private helper to setup Hive
  /// This method handles the technical setup of the database
  Future<void> _initializeHive() async {
    try {
      print("🔧 Setting up Hive database...");

      // 🎓 LEARNING: Get app's document directory
      // path_provider helps us find where to store files on device
      final appDocumentDir = await getApplicationDocumentsDirectory();
      print("📁 Storage location: ${appDocumentDir.path}");

      // 🎓 LEARNING: Initialize Hive with storage path
      // Hive needs to know where to create its database files
      Hive.init(appDocumentDir.path);

      // 🎓 LEARNING: Open a "box" (like a database table)
      // Box stores key-value pairs. 'myBox' is the table name
      _myBox = await Hive.openBox('myBox');

      print("✅ Database setup complete!");
    } catch (error) {
      print("⚠️ Database setup failed: $error");
      print("🔄 Trying fallback method...");

      // 🎓 LEARNING: Fallback - create in-memory database
      // This won't persist after app closes, but keeps app running
      await _createInMemoryDatabase();
    }
  }

  /// 🎓 LEARNING: Fallback method when file storage fails
  /// Creates a temporary database in RAM (not saved to disk)
  Future<void> _createInMemoryDatabase() async {
    try {
      // Initialize Hive without a path = in-memory only
      Hive.init(null);

      // Create box with empty bytes
      _myBox = await Hive.openBox('myBox', bytes: Uint8List(0));

      print(
        "⚠️ Using in-memory storage (data won't save between app sessions)",
      );
    } catch (error) {
      print("❌ Even in-memory database failed: $error");
      throw Exception("Could not initialize any database");
    }
  }

  /// 🎓 LEARNING: Load existing data or create initial data
  Future<void> _loadData() async {
    // 🎓 LEARNING: Check if we have saved data
    // 'TODOS' is the key where we store our todo list
    if (_myBox.containsKey('TODOS')) {
      print("📂 Loading saved todos...");

      // Get data from database
      final loadedData = _myBox.get('TODOS');

      // 🎓 LEARNING: Type checking - ensure data is a List
      if (loadedData is List) {
        // Convert from generic List to List<Map<String, dynamic>>
        todos = List<Map<String, dynamic>>.from(loadedData);
        print("✅ Loaded ${todos.length} todos");
      }
    } else {
      print("🆕 First time using app! Creating sample todos...");

      // Create initial data
      _createInitialData();

      // Save it to database
      await updateData();
    }
  }

  /// 🎓 LEARNING: Create default todos for first-time users
  void _createInitialData() {
    todos = [
      {"taskName": "Learn Flutter", "isCompleted": false},
      {"taskName": "Apply Flutter", "isCompleted": false},
    ];
    print("📝 Created ${todos.length} sample todos");
  }

  /// 🎓 LEARNING: Save current todos to database
  /// Called whenever data changes (add, delete, toggle)
  Future<void> updateData() async {
    // Save the entire todos list under key 'TODOS'
    await _myBox.put('TODOS', todos);
    print("💾 Saved ${todos.length} todos to database");
  }

  /// 🎓 LEARNING: Add a new task (Create operation in CRUD)
  void addTask(String taskName) {
    // Create new todo item
    final newTodo = {
      "taskName": taskName,
      "isCompleted": false, // New tasks are not completed
    };

    // Add to list
    todos.add(newTodo);

    // Save changes
    updateData();

    print("➕ Added task: $taskName");
  }

  /// 🎓 LEARNING: Toggle task completion (Update operation in CRUD)
  void toggleTask(int index, bool isCompleted) {
    // Update specific todo
    todos[index]["isCompleted"] = isCompleted;

    // Save changes
    updateData();

    print("✅ Toggled task at index $index to $isCompleted");
  }

  /// 🎓 LEARNING: Delete a task (Delete operation in CRUD)
  void deleteTask(int index) {
    // Remove todo at index
    final removedTask = todos.removeAt(index);

    // Save changes
    updateData();

    print("🗑️ Deleted task: ${removedTask["taskName"]}");
  }

  /// 🎓 LEARNING: Helper method to close database when done
  /// Good practice to close database connections
  Future<void> close() async {
    if (_isInitialized) {
      await _myBox.close();
      _isInitialized = false;
      print("🔒 Database closed");
    }
  }
}

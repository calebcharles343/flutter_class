// lib/presentation/screens/main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_class1/presentation/screens/layout/column_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/grid_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/list_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/row_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/stack_screen.dart';
import '../widgets/shared/menu_drawer.dart';
import '../widgets/shared/app_bar.dart';
import 'home_screen.dart';
import '../../app/routes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _currentRoute = Routes.main; // Changed from home to main
  Widget _currentScreen = const HomeScreen();
  String _currentTitle = 'Dashboard';

  void _onMenuItemSelected(String route) {
    setState(() {
      _currentRoute = route;

      switch (route) {
        case Routes.main:
          _currentScreen = const HomeScreen();
          _currentTitle = 'Dashboard';
          break;
        case Routes.layoutColumn:
          _currentScreen = const ColumnScreen();
          _currentTitle = 'Column';
          break;
        case Routes.layoutRow:
          _currentScreen = const RowScreen();
          _currentTitle = 'Row';
          break; // Added missing break statement
        case Routes.layoutGrid:
          _currentScreen = const GridScreen();
          _currentTitle = 'Grid';
          break; // Added missing break statement
        case Routes.layoutList:
          _currentScreen = const ListScreen();
          _currentTitle = 'List';
          break;
        case Routes.layoutStack:
          _currentScreen = const StackScreen();
          _currentTitle = 'Stack';
          break;
        case Routes.layoutTable:
          _currentScreen = const StackScreen();
          _currentTitle = 'Table';
          break;
        default:
          _currentScreen = const HomeScreen();
          _currentTitle = 'Dashboard';
      }
    });

    // Close the drawer after selection
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      _scaffoldKey.currentState?.openEndDrawer();
    }
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close drawer if open

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Logged out successfully!'),
                  backgroundColor: Colors.green,
                  duration: Duration(seconds: 2),
                ),
              );

              // Optionally navigate to login screen
              // Navigator.pushReplacementNamed(context, '/login');
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: CustomAppBar(
        title: _currentTitle,
        elevation: 0,
        showMenuButton: true,
        backgroundColor: Colors.grey.shade800,
        onMenuPressed: () => _scaffoldKey.currentState?.openDrawer(),
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout, color: Colors.white),
            tooltip: 'Logout',
          ),
        ],
      ),
      drawer: MenuDrawer(
        onItemSelected: _onMenuItemSelected,
        currentRoute: _currentRoute,
      ),
      body: _currentScreen,
    );
  }
}

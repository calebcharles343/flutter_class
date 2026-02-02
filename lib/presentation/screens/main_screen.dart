// lib/presentation/screens/main_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_class1/app/routes.dart';
import 'package:flutter_class1/presentation/screens/home_screen.dart';

// Layout screens
import 'package:flutter_class1/presentation/screens/layout/column_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/grid_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/list_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/row_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/stack_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/table_screen.dart';

// Navigation screens
import 'package:flutter_class1/presentation/screens/navigation/bottom_nav_screen.dart';
import 'package:flutter_class1/presentation/screens/navigation/tabs_screen.dart';
import 'package:flutter_class1/presentation/screens/navigation/drawer_screen.dart';

// Animation screens
import 'package:flutter_class1/presentation/screens/animation/basic_animation_screen.dart';
import 'package:flutter_class1/presentation/screens/animation/transitions_screen.dart';
import 'package:flutter_class1/presentation/screens/animation/hero_animation_screen.dart';

// UI Components screens
import 'package:flutter_class1/presentation/screens/ui/checkboxes_screen.dart';
import 'package:flutter_class1/presentation/screens/ui/switches_screen.dart';
import 'package:flutter_class1/presentation/screens/ui/dropdowns_screen.dart';
import 'package:flutter_class1/presentation/screens/ui/dialogs_screen.dart';
import 'package:flutter_class1/presentation/screens/ui/snackbars_screen.dart';

// Gestures screens
import 'package:flutter_class1/presentation/screens/gestures/tap_screen.dart';
import 'package:flutter_class1/presentation/screens/gestures/drag_screen.dart';
import 'package:flutter_class1/presentation/screens/gestures/scale_screen.dart';
import 'package:flutter_class1/presentation/screens/gestures/swipe_screen.dart';
import 'package:flutter_class1/presentation/screens/gestures/gesture_detector_screen.dart';
import 'package:flutter_class1/presentation/screens/gestures/pointer_screen.dart';
import 'package:flutter_class1/presentation/screens/widgets/stateful_widget_screen.dart';
import 'package:flutter_class1/presentation/screens/widgets/stateless_widget_screen.dart';

import '../widgets/shared/menu_drawer.dart';
import '../widgets/shared/app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _currentRoute = Routes.main;
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

        // Layout routes
        case Routes.layoutColumn:
          _currentScreen = const ColumnScreen();
          _currentTitle = 'Column';
          break;
        case Routes.layoutRow:
          _currentScreen = const RowScreen();
          _currentTitle = 'Row';
          break;
        case Routes.layoutGrid:
          _currentScreen = const GridScreen();
          _currentTitle = 'Grid';
          break;
        case Routes.layoutList:
          _currentScreen = const ListScreen();
          _currentTitle = 'List';
          break;
        case Routes.layoutStack:
          _currentScreen = const StackScreen();
          _currentTitle = 'Stack';
          break;
        case Routes.layoutTable:
          _currentScreen = const TableScreen();
          _currentTitle = 'Table';
          break;

        // Navigation routes
        case Routes.navigationBottomNav:
          _currentScreen = const BottomNavScreen();
          _currentTitle = 'Bottom Navigation';
          break;
        case Routes.navigationTabs:
          _currentScreen = const TabsScreen();
          _currentTitle = 'Tabs';
          break;
        case Routes.navigationDrawer:
          _currentScreen = const DrawerScreen();
          _currentTitle = 'Drawer';
          break;

        // Animation routes
        case Routes.animationBasic:
          _currentScreen = const BasicAnimationScreen();
          _currentTitle = 'Basic Animation';
          break;
        case Routes.animationTransitions:
          _currentScreen = const TransitionsScreen();
          _currentTitle = 'Transitions';
          break;
        case Routes.animationHero:
          _currentScreen = const HeroAnimationScreen();
          _currentTitle = 'Hero Animation';
          break;

        // UI Components routes
        case Routes.widgetStateless:
          _currentScreen = const StatelessWidgetScreen();
          _currentTitle = 'Stateless Widget';
          break;
        case Routes.widgetStateful:
          _currentScreen = const StatefulWidgetScreen();
          _currentTitle = 'Stateful Widget';
          break;
        case Routes.uiCheckboxes:
          _currentScreen = const CheckboxesScreen();
          _currentTitle = 'Checkboxes & Radio';
          break;
        case Routes.uiSwitches:
          _currentScreen = const SwitchesScreen();
          _currentTitle = 'Switches & Sliders';
          break;
        case Routes.uiDropdowns:
          _currentScreen = const DropdownsScreen();
          _currentTitle = 'Dropdowns & Pickers';
          break;
        case Routes.uiDialogs:
          _currentScreen = const DialogsScreen();
          _currentTitle = 'Dialogs & Modals';
          break;
        case Routes.uiSnackbars:
          _currentScreen = const SnackbarsScreen();
          _currentTitle = 'Snackbars & Toasts';
          break;

        // Gestures routes
        case Routes.gesturesTap:
          _currentScreen = const TapScreen();
          _currentTitle = 'Tap Gestures';
          break;
        case Routes.gesturesDrag:
          _currentScreen = const DragScreen();
          _currentTitle = 'Drag Gestures';
          break;
        case Routes.gesturesScale:
          _currentScreen = const ScaleScreen();
          _currentTitle = 'Scale Gestures';
          break;
        case Routes.gesturesSwipe:
          _currentScreen = const SwipeScreen();
          _currentTitle = 'Swipe Gestures';
          break;
        case Routes.gesturesDetector:
          _currentScreen = const GestureDetectorScreen();
          _currentTitle = 'Gesture Detector';
          break;
        case Routes.gesturesPointer:
          _currentScreen = const PointerScreen();
          _currentTitle = 'Pointer Events';
          break;

        default:
          _currentScreen = Container(
            color: Colors.white,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Screen for "$route" not implemented',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'This screen is under development',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      _onMenuItemSelected(Routes.main);
                    },
                    child: const Text('Go to Dashboard'),
                  ),
                ],
              ),
            ),
          );
          _currentTitle = 'Not Implemented';
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

  /////////////////////////////
  //Bottom Navigation
  /////////////////////////////

  int _bottomNavIndex = 0;

  void _onBottomNavTapped(int index) {
    setState(() {
      _bottomNavIndex = index;

      // Switch between your main app sections
      switch (index) {
        case 0: // Home
          _currentScreen = const HomeScreen();
          _currentTitle = 'Dashboard';
          break;
        case 1: // Search
          _currentScreen = const BottomNavScreen();
          _currentTitle = 'Bottom Navigation';
          break;
        case 2: // Profile
          _currentScreen = const TabsScreen();
          _currentTitle = 'Tabs';
          break;
      }
    });
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.navigation),
            label: 'Navigate',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.tab), label: 'Tabs'),
        ],
      ),
    );
  }
}

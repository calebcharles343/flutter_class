// lib/app/routes.dart
import 'package:flutter/material.dart';
import 'package:flutter_class1/presentation/screens/home_screen.dart';
import 'package:flutter_class1/presentation/screens/main_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/column_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/grid_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/list_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/row_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/stack_screen.dart';
import 'package:flutter_class1/presentation/screens/layout/table_screen.dart';

class Routes {
  static const home = '/';
  static const main = '/main';

  // Layout group routes
  static const layoutColumn = '/layout/column';
  static const layoutRow = '/layout/row';
  static const layoutGrid = '/layout/grid';
  static const layoutList = '/layout/list';
  static const layoutStack = '/layout/stack';
  static const layoutTable = '/layout/table';

  // Navigation group routes
  static const navigationBottomNav = '/navigation/bottom-nav';
  static const navigationTabs = '/navigation/tabs';
  static const navigationDrawer = '/navigation/drawer';

  // Animation group routes
  static const animationBasic = '/animation/basic';
  static const animationTransitions = '/animation/transitions';
  static const animationHero = '/animation/hero';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case main:
        return MaterialPageRoute(builder: (_) => const MainScreen());

      // Layout routes
      case layoutColumn:
        return MaterialPageRoute(builder: (_) => const ColumnScreen());
      case layoutRow:
        return MaterialPageRoute(builder: (_) => const RowScreen());
      case layoutGrid:
        return MaterialPageRoute(builder: (_) => const GridScreen());
      case layoutList:
        return MaterialPageRoute(builder: (_) => const ListScreen());
      case layoutStack:
        return MaterialPageRoute(builder: (_) => const StackScreen());
      case layoutTable:
        return MaterialPageRoute(builder: (_) => const TableScreen());

      // Navigation routes (create these screens when needed)
      // case navigationBottomNav:
      //   return MaterialPageRoute(builder: (_) => const BottomNavScreen());

      default:
        return _errorRoute(settings.name);
    }
  }

  static MaterialPageRoute _errorRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Route "$routeName" not found',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              Text(
                'This screen is under development',
                style: TextStyle(color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

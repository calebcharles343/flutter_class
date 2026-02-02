// lib/app/routes.dart
import 'package:flutter/material.dart';
import 'package:flutter_class1/presentation/screens/home_screen.dart';
import 'package:flutter_class1/presentation/screens/main_screen.dart';

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

  // UI Components routes
  static const widgetStateless = '/widgets/stateless';
  static const widgetStateful = '/widgets/stateful';
  static const uiCheckboxes = '/ui/checkboxes';
  static const uiSwitches = '/ui/switches';
  static const uiDropdowns = '/ui/dropdowns';
  static const uiDialogs = '/ui/dialogs';
  static const uiSnackbars = '/ui/snackbars';

  // Gestures routes
  static const gesturesTap = '/gestures/tap';
  static const gesturesDrag = '/gestures/drag';
  static const gesturesScale = '/gestures/scale';
  static const gesturesSwipe = '/gestures/swipe';
  static const gesturesDetector = '/gestures/detector';
  static const gesturesPointer = '/gestures/pointer';

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

      // Navigation routes
      case navigationBottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNavScreen());
      case navigationTabs:
        return MaterialPageRoute(builder: (_) => const TabsScreen());
      case navigationDrawer:
        return MaterialPageRoute(builder: (_) => const DrawerScreen());

      // Animation routes
      case animationBasic:
        return MaterialPageRoute(builder: (_) => const BasicAnimationScreen());
      case animationTransitions:
        return MaterialPageRoute(builder: (_) => const TransitionsScreen());
      case animationHero:
        return MaterialPageRoute(builder: (_) => const HeroAnimationScreen());

      // UI Components routes
      case widgetStateless:
        return MaterialPageRoute(builder: (_) => const StatelessWidgetScreen());
      case widgetStateful:
        return MaterialPageRoute(builder: (_) => const StatefulWidgetScreen());
      case uiCheckboxes:
        return MaterialPageRoute(builder: (_) => const CheckboxesScreen());
      case uiSwitches:
        return MaterialPageRoute(builder: (_) => const SwitchesScreen());
      case uiDropdowns:
        return MaterialPageRoute(builder: (_) => const DropdownsScreen());
      case uiDialogs:
        return MaterialPageRoute(builder: (_) => const DialogsScreen());
      case uiSnackbars:
        return MaterialPageRoute(builder: (_) => const SnackbarsScreen());

      // Gestures routes
      case gesturesTap:
        return MaterialPageRoute(builder: (_) => const TapScreen());
      case gesturesDrag:
        return MaterialPageRoute(builder: (_) => const DragScreen());
      case gesturesScale:
        return MaterialPageRoute(builder: (_) => const ScaleScreen());
      case gesturesSwipe:
        return MaterialPageRoute(builder: (_) => const SwipeScreen());
      case gesturesDetector:
        return MaterialPageRoute(builder: (_) => const GestureDetectorScreen());
      case gesturesPointer:
        return MaterialPageRoute(builder: (_) => const PointerScreen());

      default:
        return _errorRoute(settings.name);
    }
  }

  static MaterialPageRoute _errorRoute(String? routeName) {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        // appBar: AppBar(title: const Text('Error')),
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

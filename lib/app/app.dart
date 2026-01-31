// lib/app/app.dart
import 'package:flutter/material.dart';
import 'theme.dart';
import 'routes.dart';

class FlutterClass extends StatelessWidget {
  const FlutterClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Class',
      theme: appTheme,
      initialRoute: Routes.main, // Start with MainScreen which has drawer
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

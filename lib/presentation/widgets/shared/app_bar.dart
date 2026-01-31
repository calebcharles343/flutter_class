// lib/presentation/widgets/shared/app_bar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final double? elevation;
  final List<Widget>? actions;
  final bool showMenuButton;
  final VoidCallback?
  onMenuPressed; // Make this required or provide better handling
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor,
    this.elevation,
    this.actions,
    this.showMenuButton = false,
    required this.onMenuPressed, // Make it required
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color appBarColor = backgroundColor ?? Theme.of(context).primaryColor;

    Widget? leading;

    if (showMenuButton) {
      leading = IconButton(
        icon: const Icon(Icons.menu),
        onPressed: onMenuPressed, // Use the callback passed from parent
        color: Colors.grey.shade100,
      );
    } else if (showBackButton) {
      leading = IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
        color: Colors.grey.shade100,
      );
    }

    return AppBar(
      title: Text(title, style: TextStyle(color: Colors.grey.shade100)),
      centerTitle: true,
      backgroundColor: appBarColor,
      elevation: elevation,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

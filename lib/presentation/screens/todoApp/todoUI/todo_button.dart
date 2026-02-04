import 'package:flutter/material.dart';

class TodoButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  final Widget? leadingIcon;
  final Color? backgroundColor;
  final Color? textColor;
  final double? elevation;
  final EdgeInsetsGeometry? padding;

  const TodoButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.leadingIcon,
    this.backgroundColor,
    this.textColor,
    this.elevation,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: backgroundColor ?? Theme.of(context).primaryColor,
      textColor: textColor ?? Colors.white,
      elevation: elevation ?? 2.0,
      padding:
          padding ??
          const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            leadingIcon!,
            const SizedBox(width: 8.0),
          ],
          Text(
            name,
            style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

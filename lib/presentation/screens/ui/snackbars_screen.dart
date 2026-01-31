import 'package:flutter/material.dart';

class SnackbarsScreen extends StatefulWidget {
  const SnackbarsScreen({super.key});

  @override
  State<SnackbarsScreen> createState() => _SnackbarsScreenState();
}

class _SnackbarsScreenState extends State<SnackbarsScreen> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(title: const Text('Snackbars & Toasts')),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Snackbar Examples',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Different types of snackbars and toast messages',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 30),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _SnackbarCard(
                      title: 'Basic Snackbar',
                      color: Colors.blue,
                      onTap: () => _showBasicSnackbar(context),
                    ),
                    _SnackbarCard(
                      title: 'Action Snackbar',
                      color: Colors.green,
                      onTap: () => _showActionSnackbar(context),
                    ),
                    _SnackbarCard(
                      title: 'Custom Snackbar',
                      color: Colors.orange,
                      onTap: () => _showCustomSnackbar(context),
                    ),
                    _SnackbarCard(
                      title: 'Floating Snackbar',
                      color: Colors.purple,
                      onTap: () => _showFloatingSnackbar(context),
                    ),
                    _SnackbarCard(
                      title: 'Error Toast',
                      color: Colors.red,
                      onTap: () => _showErrorToast(context),
                    ),
                    _SnackbarCard(
                      title: 'Success Toast',
                      color: Colors.teal,
                      onTap: () => _showSuccessToast(context),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),

              const Text(
                'Toast Messages',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _showToast(context, 'Short toast message'),
                child: const Text('Show Short Toast'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _showToast(
                  context,
                  'This is a longer toast message that demonstrates wrapping text in toast notifications',
                ),
                child: const Text('Show Long Toast'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _showLoadingToast(context),
                child: const Text('Show Loading Toast'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBasicSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('This is a basic snackbar'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showActionSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Item deleted'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Action undone!')));
          },
        ),
      ),
    );
  }

  void _showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.white),
            const SizedBox(width: 10),
            const Expanded(child: Text('Custom snackbar with icon')),
          ],
        ),
        backgroundColor: Colors.orange.shade700,
        behavior: SnackBarBehavior.fixed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showFloatingSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Floating snackbar'),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showErrorToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white),
            SizedBox(width: 10),
            Expanded(child: Text('Error: Something went wrong!')),
          ],
        ),
        backgroundColor: Colors.red.shade700,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showSuccessToast(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 10),
            Expanded(child: Text('Success: Operation completed!')),
          ],
        ),
        backgroundColor: Colors.green.shade700,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  void _showToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _showLoadingToast(BuildContext context) {
    final snackBar = SnackBar(
      content: Row(
        children: [
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ),
          const SizedBox(width: 15),
          const Expanded(child: Text('Loading...')),
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
            child: const Text('CANCEL'),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey.shade700,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 5),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class _SnackbarCard extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;

  const _SnackbarCard({
    required this.title,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color.withOpacity(0.1),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
                child: Icon(_getIcon(), color: Colors.white, size: 30),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (title) {
      case 'Basic Snackbar':
        return Icons.message;
      case 'Action Snackbar':
        return Icons.touch_app;
      case 'Custom Snackbar':
        return Icons.design_services;
      case 'Floating Snackbar':
        return Icons.flip_to_front;
      case 'Error Toast':
        return Icons.error;
      case 'Success Toast':
        return Icons.check_circle;
      default:
        return Icons.message;
    }
  }
}

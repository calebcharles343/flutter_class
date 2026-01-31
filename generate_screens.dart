#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

// ———————————————— CONFIG ————————————————
// Update these paths according to your project structure
const String projectRoot =
    'C:\\Users\\charles\\Documents\\flutter_projects\\flutter_class';
// OR use current directory:
// final String projectRoot = Directory.current.path;

const Map<String, List<String>> filesToGenerate = {
  // Navigation screens
  'lib/presentation/screens/navigation/': [
    'bottom_nav_screen.dart',
    'tabs_screen.dart',
    'drawer_screen.dart',
  ],

  // Animation screens
  'lib/presentation/screens/animation/': [
    'basic_animation_screen.dart',
    'transitions_screen.dart',
    'hero_animation_screen.dart',
  ],

  // UI component screens
  'lib/presentation/screens/ui/': [
    'checkboxes_screen.dart',
    'switches_screen.dart',
    'dropdowns_screen.dart',
    'dialogs_screen.dart',
    'snackbars_screen.dart',
  ],

  // Gesture screens
  'lib/presentation/screens/gestures/': [
    'tap_screen.dart',
    'drag_screen.dart',
    'scale_screen.dart',
    'swipe_screen.dart',
    'gesture_detector_screen.dart',
    'pointer_screen.dart',
  ],
};

// Template for generated files
const String screenTemplate = '''
import 'package:flutter/material.dart';

class {ClassName} extends StatelessWidget {
  const {ClassName}({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{ScreenName}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '{ScreenName} Screen',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            Text(
              'Implement your {FeatureName} here',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
''';

// ———————————————— UTILS ————————————————
class FileGenerator {
  final String projectRoot;

  FileGenerator(this.projectRoot);

  // Convert filename to class name (e.g., "bottom_nav_screen.dart" -> "BottomNavScreen")
  String _getClassName(String fileName) {
    final nameWithoutExt = fileName.replaceFirst('.dart', '');
    final words = nameWithoutExt.split('_');
    final className = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join();
    return className;
  }

  // Get screen name for display (e.g., "bottom_nav_screen.dart" -> "Bottom Nav")
  String _getScreenName(String fileName) {
    final nameWithoutExt = fileName.replaceFirst('.dart', '');
    final words = nameWithoutExt.split('_');
    final screenName = words
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
    return screenName;
  }

  // Get feature name (e.g., "bottom_nav_screen.dart" -> "bottom navigation")
  String _getFeatureName(String fileName) {
    final nameWithoutExt = fileName.replaceFirst('.dart', '');
    return nameWithoutExt.replaceAll('_', ' ');
  }

  // Generate file content with proper class name
  String _generateFileContent(String fileName) {
    final className = _getClassName(fileName);
    final screenName = _getScreenName(fileName);
    final featureName = _getFeatureName(fileName);

    return screenTemplate
        .replaceAll('{ClassName}', className)
        .replaceAll('{ScreenName}', screenName)
        .replaceAll('{FeatureName}', featureName);
  }

  // Create directory if it doesn't exist
  void _ensureDirectoryExists(String path) {
    final dir = Directory(path);
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('📁 Created directory: $path');
    }
  }

  // Generate all files
  void generateAllFiles() {
    print('\n🚀 Starting file generation...\n');

    int totalFiles = 0;
    int createdFiles = 0;
    int skippedFiles = 0;

    filesToGenerate.forEach((directory, fileList) {
      final fullPath = '$projectRoot${Platform.pathSeparator}$directory';
      _ensureDirectoryExists(fullPath);

      for (final fileName in fileList) {
        totalFiles++;
        final filePath = '$fullPath$fileName';
        final file = File(filePath);

        if (file.existsSync()) {
          print('⚠️  Skipping (already exists): $filePath');
          skippedFiles++;
        } else {
          try {
            final content = _generateFileContent(fileName);
            file.writeAsStringSync(content);
            print('✅ Created: $filePath');
            createdFiles++;
          } catch (e) {
            print('❌ Error creating $filePath: $e');
          }
        }
      }
    });

    // Summary
    print('\n═══════════════════════════════════════════════');
    print('📊 GENERATION SUMMARY');
    print('═══════════════════════════════════════════════');
    print('📋 Total files configured: $totalFiles');
    print('✅ Newly created files: $createdFiles');
    print('⚠️  Skipped (already existing): $skippedFiles');
    print('📁 Project root: $projectRoot');

    // Show tree structure of generated folders
    print('\n📁 Generated folder structure:');
    filesToGenerate.forEach((directory, fileList) {
      print('  📁 $directory');
      for (final fileName in fileList) {
        final filePath = '$directory$fileName';
        final file = File('$projectRoot${Platform.pathSeparator}$filePath');
        if (file.existsSync()) {
          print('    📄 $fileName');
        }
      }
    });
  }

  // Delete all generated files (cleanup)
  void cleanup() {
    print('\n🧹 Starting cleanup...\n');

    int deletedFiles = 0;
    int notFoundFiles = 0;

    filesToGenerate.forEach((directory, fileList) {
      for (final fileName in fileList) {
        final fullPath =
            '$projectRoot${Platform.pathSeparator}$directory$fileName';
        final file = File(fullPath);

        if (file.existsSync()) {
          try {
            file.deleteSync();
            print('🗑️  Deleted: $fullPath');
            deletedFiles++;
          } catch (e) {
            print('❌ Error deleting $fullPath: $e');
          }
        } else {
          notFoundFiles++;
        }
      }
    });

    print('\n═══════════════════════════════════════════════');
    print('🧹 CLEANUP SUMMARY');
    print('═══════════════════════════════════════════════');
    print('🗑️  Deleted files: $deletedFiles');
    print('🔍 Files not found: $notFoundFiles');
  }
}

// ———————————————— MAIN ————————————————
void main(List<String> arguments) {
  print('\n\x1B[1;35m═══════════════════════════════════════════════\x1B[0m');
  print('\x1B[1;35m         🚀 FLUTTER SCREEN GENERATOR           \x1B[0m');
  print('\x1B[1;35m═══════════════════════════════════════════════\x1B[0m\n');

  // Configure project root
  String currentProjectRoot = projectRoot;

  // If projectRoot is not set, use current directory
  if (projectRoot.isEmpty) {
    currentProjectRoot = Directory.current.path;
    print('⚠️  Using current directory as project root: $currentProjectRoot');
  }

  // Check if this looks like a Flutter project
  final pubspecFile = File(
    '$currentProjectRoot${Platform.pathSeparator}pubspec.yaml',
  );
  if (!pubspecFile.existsSync()) {
    print('\n❌ ERROR: pubspec.yaml not found in $currentProjectRoot');
    print('💡 Make sure you\'re in the root of your Flutter project');
    print('💡 Or update the projectRoot constant in the script');
    exit(1);
  }

  final generator = FileGenerator(currentProjectRoot);

  // Parse command line arguments
  if (arguments.contains('--cleanup') || arguments.contains('-c')) {
    print('🧹 Running in cleanup mode...\n');
    generator.cleanup();
  } else {
    print('📝 Running in generation mode...\n');
    generator.generateAllFiles();

    print('\n💡 TIPS:');
    print('  • Run with --cleanup or -c flag to remove generated files');
    print('  • Modify the filesToGenerate map to add/remove files');
    print('  • Update the screenTemplate to customize file content');
    print(
      '  • Check the projectRoot constant if files are generated in wrong location',
    );
  }

  print('\n\x1B[1;35m═══════════════════════════════════════════════\x1B[0m\n');
}

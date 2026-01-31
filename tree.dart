#!/usr/bin/env dart
// ignore_for_file: avoid_print

import 'dart:io';

// ———————————————— CONFIG ————————————————
const ignoreDirs = {
  '.dart_tool',
  '.git',
  '.idea',
  'build',
  'ios/build',
  'android/app/build',
  'linux/build',
  'macos/build',
  'windows/build',
  'web/build',
  'coverage',
  'node_modules',
  '.gradle',
  'DerivedData',
};

const showFileTypes = {
  'dart',
  'yaml',
  'yml',
  'json',
  'xml',
  'plist',
  'gradle',
  'kt',
  'swift',
  'md',
};

const criticalFiles = {
  'pubspec.yaml': '📦 Dependencies & config',
  'lib/main.dart': '🚀 App entry point',
  'analysis_options.yaml': '🔍 Lint rules',
  'README.md': '📖 Documentation',
  'test/widget_test.dart': '🧪 Default test',
};

// ———————————————— UTILS ————————————————
class TreePrinter {
  final Map<String, bool> _flutterFiles = {
    'lib/': true,
    'test/': true,
    'integration_test/': true,
    'assets/': true,
  };

  String _formatName(String name, bool isDir, bool isCritical) {
    if (isCritical) {
      return '\x1B[1;32m📄 $name\x1B[0m';
    }
    if (isDir && _flutterFiles.containsKey('$name/')) {
      return '\x1B[1;34m📁 $name/\x1B[0m';
    }
    if (isDir) {
      return '\x1B[34m📁 $name/\x1B[0m';
    }
    if (name.endsWith('.dart')) {
      return '\x1B[36m📄 $name\x1B[0m';
    }
    if (name.endsWith('.yaml') || name.endsWith('.yml')) {
      return '\x1B[33m⚙️  $name\x1B[0m';
    }
    return '\x1B[37m📄 $name\x1B[0m';
  }

  void printTree(
    String dir, {
    String prefix = '',
    bool isLast = true, // This is the parent's "isLast" status
    int depth = 0,
    int maxDepth = 4,
  }) {
    if (depth > maxDepth) {
      return;
    }

    final dirObj = Directory(dir);
    if (!dirObj.existsSync()) {
      return;
    }

    List<FileSystemEntity> entries;
    try {
      entries = dirObj.listSync();
    } catch (e) {
      return;
    }

    // Filter and sort
    entries = entries.where((entry) {
      final name = entry.path.split(Platform.pathSeparator).last;
      if (name.startsWith('.')) {
        return name == '.packages' || name == '.metadata';
      }
      return !ignoreDirs.contains(name);
    }).toList();

    entries.sort((a, b) {
      final aIsDir = a is Directory;
      final bIsDir = b is Directory;
      if (aIsDir != bIsDir) {
        return bIsDir ? 1 : -1;
      }
      return a.path.compareTo(b.path);
    });

    for (int i = 0; i < entries.length; i++) {
      final entry = entries[i];
      final name = entry.path.split(Platform.pathSeparator).last;
      final last = i == entries.length - 1;
      final isDir = entry is Directory;
      final ext = name.contains('.') ? name.split('.').last.toLowerCase() : '';

      // Skip if not a directory and file type not in showFileTypes
      if (!isDir &&
          !showFileTypes.contains(ext) &&
          !criticalFiles.containsKey(name)) {
        continue;
      }

      final isCritical = criticalFiles.containsKey(name);
      final formattedName = _formatName(name, isDir, isCritical);
      final branch = last ? '└── ' : '├── ';
      final connector = last ? '    ' : '│   '; // FIXED THIS LINE

      print('$prefix$branch$formattedName');

      if (isDir) {
        final newPrefix = prefix + connector;
        printTree(
          entry.path,
          prefix: newPrefix,
          isLast: last, // This passes 'last' as 'isLast' to the next level
          depth: depth + 1,
          maxDepth: maxDepth,
        );
      }
    }
  }
}

// ———————————————— MAIN ————————————————
void main() async {
  print('\n\x1B[1;35m═══════════════════════════════════════════════\x1B[0m');
  print('\x1B[1;35m         🎯 FLUTTER PROJECT STRUCTURE          \x1B[0m');
  print('\x1B[1;35m═══════════════════════════════════════════════\x1B[0m\n');

  // Find project root
  String projectRoot = Directory.current.path;
  Directory current = Directory.current;

  while (true) {
    final pubspec = File(
      '${current.path}${Platform.pathSeparator}pubspec.yaml',
    );
    if (pubspec.existsSync()) {
      projectRoot = current.path;
      break;
    }
    if (current.path == current.parent.path) {
      break;
    }
    current = current.parent;
  }

  // Read pubspec info
  final pubspecFile = File('$projectRoot${Platform.pathSeparator}pubspec.yaml');
  String projectName = 'Unknown';
  String flutterVersion = 'Unknown';

  if (pubspecFile.existsSync()) {
    try {
      final content = await pubspecFile.readAsString();
      final lines = content.split('\n');

      for (final line in lines) {
        final trimmed = line.trim();
        if (trimmed.startsWith('name:')) {
          projectName = trimmed
              .split(':')[1]
              .trim()
              .replaceAll('"', '')
              .replaceAll("'", '');
        }
        if (trimmed.startsWith('flutter:')) {
          final nextLine = lines[lines.indexOf(line) + 1];
          if (nextLine.trim().startsWith('sdk:')) {
            flutterVersion = nextLine
                .trim()
                .split(':')[1]
                .trim()
                .replaceAll('"', '')
                .replaceAll("'", '');
          }
        }
      }
    } catch (e) {
      // Ignore
    }
  }

  print('\x1B[1m📁 Project:\x1B[0m \x1B[36m$projectName\x1B[0m');
  print('\x1B[1m📍 Location:\x1B[0m \x1B[90m$projectRoot\x1B[0m');
  if (flutterVersion != 'Unknown') {
    print('\x1B[1m🎯 Flutter SDK:\x1B[0m \x1B[33m$flutterVersion\x1B[0m');
  }
  print('');

  // Print tree
  final printer = TreePrinter();
  printer.printTree(projectRoot, maxDepth: 4);

  // Show summary
  print('\n\x1B[1;35m═══════════════════════════════════════════════\x1B[0m');
  print('\x1B[1m📊 PROJECT SUMMARY\x1B[0m');
  print('\x1B[1;35m═══════════════════════════════════════════════\x1B[0m');

  // Count files
  int dartFiles = 0;
  int widgetFiles = 0;
  int testFiles = 0;

  void countFiles(Directory dir) {
    try {
      for (final entity in dir.listSync(recursive: false)) {
        if (entity is File) {
          final name = entity.path.split(Platform.pathSeparator).last;
          if (name.endsWith('.dart')) {
            dartFiles++;
            if (name.contains('widget') ||
                name.contains('page') ||
                name.contains('screen')) {
              widgetFiles++;
            }
            if (name.contains('_test.dart') || name.contains('test_')) {
              testFiles++;
            }
          }
        } else if (entity is Directory) {
          final dirName = entity.path.split(Platform.pathSeparator).last;
          if (!ignoreDirs.contains(dirName) && !dirName.startsWith('.')) {
            countFiles(entity);
          }
        }
      }
    } catch (e) {
      // Ignore
    }
  }

  countFiles(Directory(projectRoot));

  print('   \x1B[34m📊 Statistics:\x1B[0m');
  print('     • \x1B[36m$dartFiles\x1B[0m Dart files');
  print('     • \x1B[32m$widgetFiles\x1B[0m UI/widget files');
  print('     • \x1B[33m$testFiles\x1B[0m test files');

  // Health check
  print('\n   \x1B[34m🔍 Health Check:\x1B[0m');

  final checks = {
    'lib/main.dart': File(
      '$projectRoot${Platform.pathSeparator}lib${Platform.pathSeparator}main.dart',
    ),
    'pubspec.yaml': pubspecFile,
    'analysis_options.yaml': File(
      '$projectRoot${Platform.pathSeparator}analysis_options.yaml',
    ),
  };

  checks.forEach((name, file) {
    if (file.existsSync()) {
      print('     • ✅ \x1B[32m$name\x1B[0m');
    } else {
      print('     • ⚠️  \x1B[33m$name (missing)\x1B[0m');
    }
  });

  print(
    '\n\x1B[90m💡 Tip: Run this script from your project root for best results\x1B[0m\n',
  );
}

## How to Use:

1. **Save the script** as `generate_screens.dart` in your project root (next to `tree.dart`).

2. **Configure the project root**:

   - Update the `projectRoot` constant to match your project path, OR
   - Remove the hardcoded path and it will use the current directory

3. **Run the generator**:

```bash
dart generate_screens.dart
```

4. **Clean up generated files** (if needed):

```bash
dart generate_screens.dart --cleanup
# or
dart generate_screens.dart -c
```

## Customization Options:

1. **Add more files**: Edit the `filesToGenerate` map:

```dart
const Map<String, List<String>> filesToGenerate = {
  'lib/presentation/screens/new_category/': [
    'file1.dart',
    'file2.dart',
  ],
};
```

2. **Change template**: Modify the `screenTemplate` constant

3. **Change project structure**: Update directory paths in `filesToGenerate`

4. **Add custom logic**: Extend the `FileGenerator` class with your own methods

## Features:

- ✅ Creates directories if they don't exist
- ✅ Skips existing files (no overwriting)
- ✅ Cleanup option to remove generated files
- ✅ Proper Flutter widget templates
- ✅ Colorful console output
- ✅ Error handling
- ✅ Summary of operations

The script will create all the specified files with proper Flutter widget structure, ready for you to implement your specific functionality!

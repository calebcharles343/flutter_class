import 'package:flutter/material.dart';

class CheckboxesScreen extends StatefulWidget {
  const CheckboxesScreen({super.key});

  @override
  State<CheckboxesScreen> createState() => _CheckboxesScreenState();
}

class _CheckboxesScreenState extends State<CheckboxesScreen> {
  bool _checkboxValue = false;
  bool _checkboxListTileValue = false;
  List<bool> _checkboxGroupValues = [false, false, false];
  bool? _tristateCheckboxValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkboxes & Radio')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Checkbox Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Different types of checkboxes and their usage',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Basic Checkbox
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Basic Checkbox',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: _checkboxValue,
                          onChanged: (value) {
                            setState(() {
                              _checkboxValue = value!;
                            });
                          },
                        ),
                        const Text('Accept Terms and Conditions'),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // CheckboxListTile
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'CheckboxListTile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    CheckboxListTile(
                      title: const Text('Enable Notifications'),
                      subtitle: const Text('Receive push notifications'),
                      value: _checkboxListTileValue,
                      onChanged: (value) {
                        setState(() {
                          _checkboxListTileValue = value!;
                        });
                      },
                      secondary: const Icon(Icons.notifications),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Checkbox Group
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Checkbox Group',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ..._buildCheckboxGroup(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Tri-state Checkbox
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Tri-state Checkbox',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: _tristateCheckboxValue,
                          tristate: true,
                          onChanged: (value) {
                            setState(() {
                              _tristateCheckboxValue = value;
                            });
                          },
                        ),
                        const Text('Select All (Tri-state)'),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Current value: $_tristateCheckboxValue',
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),

            // Radio Buttons
            const Text(
              'Radio Button Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Basic Radio
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Gender Selection',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildGenderRadio(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCheckboxGroup() {
    final labels = ['Option 1', 'Option 2', 'Option 3'];
    return List.generate(labels.length, (index) {
      return CheckboxListTile(
        title: Text(labels[index]),
        value: _checkboxGroupValues[index],
        onChanged: (value) {
          setState(() {
            _checkboxGroupValues[index] = value!;
          });
        },
      );
    });
  }

  String? _selectedGender;

  Widget _buildGenderRadio() {
    return Column(
      children: [
        ListTile(
          title: const Text('Male'),
          leading: Radio<String>(
            value: 'male',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<String>(
            value: 'female',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Other'),
          leading: Radio<String>(
            value: 'other',
            groupValue: _selectedGender,
            onChanged: (value) {
              setState(() {
                _selectedGender = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

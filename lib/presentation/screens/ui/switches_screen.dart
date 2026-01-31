import 'package:flutter/material.dart';

class SwitchesScreen extends StatefulWidget {
  const SwitchesScreen({super.key});

  @override
  State<SwitchesScreen> createState() => _SwitchesScreenState();
}

class _SwitchesScreenState extends State<SwitchesScreen> {
  bool _switchValue = false;
  bool _adaptiveSwitchValue = false;
  bool _customSwitchValue = false;
  double _sliderValue = 0.5;
  RangeValues _rangeSliderValue = const RangeValues(0.2, 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Switches & Sliders')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Switch Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Different types of switches and their usage',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Basic Switch
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Basic Switch',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Enable Feature'),
                        Switch(
                          value: _switchValue,
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Status: ${_switchValue ? 'ON' : 'OFF'}',
                      style: TextStyle(
                        color: _switchValue ? Colors.green : Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // SwitchListTile
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'SwitchListTile',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SwitchListTile(
                      title: const Text('Dark Mode'),
                      subtitle: const Text('Enable dark theme'),
                      value: _adaptiveSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          _adaptiveSwitchValue = value;
                        });
                      },
                      secondary: Icon(
                        _adaptiveSwitchValue
                            ? Icons.dark_mode
                            : Icons.light_mode,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Custom Switch
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Custom Styled Switch',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Custom Colors'),
                        Switch(
                          value: _customSwitchValue,
                          onChanged: (value) {
                            setState(() {
                              _customSwitchValue = value;
                            });
                          },
                          activeColor: Colors.purple,
                          activeTrackColor: Colors.purple.shade200,
                          inactiveThumbColor: Colors.grey,
                          inactiveTrackColor: Colors.grey.shade300,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),

            // Sliders
            const Text(
              'Slider Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Basic Slider
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Basic Slider',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Slider(
                      value: _sliderValue,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                      min: 0,
                      max: 1,
                      divisions: 10,
                      label: _sliderValue.toStringAsFixed(2),
                    ),
                    Text(
                      'Value: ${_sliderValue.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Range Slider
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Range Slider',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RangeSlider(
                      values: _rangeSliderValue,
                      onChanged: (values) {
                        setState(() {
                          _rangeSliderValue = values;
                        });
                      },
                      min: 0,
                      max: 1,
                      divisions: 10,
                      labels: RangeLabels(
                        _rangeSliderValue.start.toStringAsFixed(2),
                        _rangeSliderValue.end.toStringAsFixed(2),
                      ),
                    ),
                    Text(
                      'Range: ${_rangeSliderValue.start.toStringAsFixed(2)} - ${_rangeSliderValue.end.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Custom Slider
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Custom Styled Slider',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.deepPurple,
                        inactiveTrackColor: Colors.deepPurple.shade100,
                        thumbColor: Colors.deepPurple,
                        overlayColor: Colors.deepPurple.withAlpha(32),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 12,
                        ),
                        trackHeight: 6,
                      ),
                      child: Slider(
                        value: 0.7,
                        onChanged: (value) {},
                        min: 0,
                        max: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

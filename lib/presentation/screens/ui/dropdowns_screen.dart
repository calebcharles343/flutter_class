import 'package:flutter/material.dart';

class DropdownsScreen extends StatefulWidget {
  const DropdownsScreen({super.key});

  @override
  State<DropdownsScreen> createState() => _DropdownsScreenState();
}

class _DropdownsScreenState extends State<DropdownsScreen> {
  String? _selectedCountry;
  String? _selectedCity;
  // List<String>? _selectedMultipleItems;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<String> _countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Japan',
    'India',
  ];

  final List<String> _cities = [
    'New York',
    'Los Angeles',
    'Chicago',
    'Houston',
    'Phoenix',
    'Philadelphia',
  ];

  // final List<String> _multipleOptions = [
  //   'Flutter',
  //   'Dart',
  //   'Firebase',
  //   'Provider',
  //   'Bloc',
  //   'GetX',
  //   'Riverpod',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdowns & Pickers')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dropdown & Picker Examples',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Various dropdown menus and selection pickers',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // Basic Dropdown
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Basic Dropdown',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DropdownButtonFormField<String>(
                      initialValue: _selectedCountry,
                      decoration: const InputDecoration(
                        labelText: 'Select Country',
                        border: OutlineInputBorder(),
                      ),
                      items: _countries.map((String country) {
                        return DropdownMenuItem<String>(
                          value: country,
                          child: Text(country),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCountry = value;
                        });
                      },
                    ),
                    if (_selectedCountry != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        'Selected: $_selectedCountry',
                        style: TextStyle(
                          color: Colors.green.shade700,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Custom Dropdown
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Styled Dropdown',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: _selectedCity,
                        hint: const Text('Select City'),
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: _cities.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Row(
                              children: [
                                const Icon(Icons.location_city, size: 20),
                                const SizedBox(width: 8),
                                Text(city),
                              ],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCity = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Date Picker
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Date Picker',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text(
                        _selectedDate == null
                            ? 'Select Date'
                            : 'Selected: ${_selectedDate!.toLocal()}'.split(
                                ' ',
                              )[0],
                      ),
                      trailing: const Icon(Icons.arrow_drop_down),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );
                        if (picked != null) {
                          setState(() {
                            _selectedDate = picked;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Time Picker
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Time Picker',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ListTile(
                      leading: const Icon(Icons.access_time),
                      title: Text(
                        _selectedTime == null
                            ? 'Select Time'
                            : 'Selected: ${_selectedTime!.format(context)}',
                      ),
                      trailing: const Icon(Icons.arrow_drop_down),
                      onTap: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (picked != null) {
                          setState(() {
                            _selectedTime = picked;
                          });
                        }
                      },
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StatefulWidgetScreen extends StatefulWidget {
  const StatefulWidgetScreen({super.key});

  @override
  State<StatefulWidgetScreen> createState() => _StatefulWidgetScreenState();
}

class _StatefulWidgetScreenState extends State<StatefulWidgetScreen> {
  //Variable
  int _counter = 0;

  //Method
  void _incrementCounter() {
    //Set state rebuilds the widgets
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    //Set state rebuilds the widgets
    setState(() {
      _counter > 0 ? _counter-- : _counter;
    });
  }

  void _resetCounter() {
    //Set state rebuilds the widgets
    setState(() {
      _counter = 0;
    });
  }

  // Ui
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "You pushed the button $_counter times",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _incrementCounter, child: Text("Add")),

              const Gap(30),

              ElevatedButton(
                onPressed: _decrementCounter,
                child: Text("Reduce"),
              ),
              const Gap(30),
              ElevatedButton(onPressed: _resetCounter, child: Text("Reset")),
            ],
          ),
        ],
      ),
    );
  }
}

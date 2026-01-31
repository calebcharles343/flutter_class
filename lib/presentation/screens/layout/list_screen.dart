import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    final boxes = [
      Box(
        id: 1,
        name: "box 1",
        width: 350,
        height: 350,
        color: Colors.deepPurple.shade700,
        // expanded: true,
        // flexCount: 2,
      ),
      Box(
        id: 2,
        name: "box 2",
        width: 350,
        height: 350,
        color: Colors.deepPurple.shade500,
        // expanded: false,
      ),
      Box(
        id: 3,
        name: "box 3",
        width: 350,
        height: 350,
        color: Colors.deepPurple.shade300,
        // expanded: true, // This one will expand!
      ),
    ];

      return Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.deepPurple.shade100,
        child: ListView(
          // scrollDirection: Axis.horizontal,
          children: boxes.map((box) {
            // Use Expanded widget if box.expanded is true
            Widget container = Container(
              width: box.width,
              height: box.height,
              color: box.color,
              // margin: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  box.name,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            );

            // Wrap with Expanded if needed
            if (box.expanded ?? false) {
              return Expanded(flex: box.flexCount ?? 1, child: container);
            } else {
              return container;
            }
          }).toList(),
        ),
      );
    }
    */
    final items = [
      "Apple",
      "Banana",
      "Cherry",
      "Orange",
      "Grape",
      "Mango",
      "Strawberry",
    ];

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepPurple.shade100,
      child: ListView.builder(
        itemCount: items.length,
        // itemBuilder: (context, index) => ListTile(
        //   title: Text(
        //     '$index.toString(): ',
        //     style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        //   ),
        // ),
        itemBuilder: (context, index) {
          var item = items[index];
          var number = index + 1;

          return ListTile(
            title: Text(
              '$number. $item',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
    );
  }
}

class Box {
  final int id;
  final String name;
  final double? width;
  final double? height;
  final Color color;
  final bool? expanded;
  final int? flexCount;

  Box({
    required this.id,
    required this.name,
    this.width,
    this.height,
    required this.color,
    this.expanded,
    this.flexCount,
  });
}

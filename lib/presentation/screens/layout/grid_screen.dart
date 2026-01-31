import 'package:flutter/material.dart';

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

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
      ),
      Box(
        id: 2,
        name: "box 2",
        width: 350,
        height: 350,
        color: Colors.deepPurple.shade500,
      ),
      Box(
        id: 3,
        name: "box 3",
        width: 350,
        height: 350,
        color: Colors.deepPurple.shade300,
      ),
    ];

    final boxes = List<Box>.generate(30, (index) {
      final boxNumber = index + 1;
      // final shadeValue = 700 - (index % 8) * 100; // Creates varying shades
      // final shade = shadeValue.clamp(50, 900); // Keep within valid range

      return Box(
        id: boxNumber,
        name: "box $boxNumber",
        width: 350,
        height: 350,
        // color: Colors.deepPurple.shade(shade),
        color: Colors.deepPurple.shade500,
      );
    });
*/
    final boxes = List<Box>.generate(30, (index) {
      final boxNumber = index + 1;

      // Create sizes that vary (250-450)
      final size = 250 + (index % 5) * 50;

      // Create a color palette
      final colors = [
        Colors.deepPurple,
        Colors.purple,
        Colors.indigo,
        Colors.blue,
        Colors.teal,
      ];
      final color = colors[index % colors.length].withOpacity(0.8);

      return Box(
        id: boxNumber,
        name: "Item $boxNumber",
        width: size.toDouble(),
        height: size.toDouble(),
        color: color,
      );
    });

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepPurple.shade100,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 10, // Optional: space between rows
          crossAxisSpacing: 10, // Optional: space between columns
          childAspectRatio: 1, // Optional: square items (height/width ratio)
        ),
        itemCount: boxes.length, // THIS WAS MISSING
        itemBuilder: (context, index) {
          var box = boxes[index];
          return Container(
            color: box.color,
            child: Center(
              child: Text(
                box.name,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          );
        },
      ),

      /*  
      child: GridView.builder(
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
      ),*/
    );
  }

  /*
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
  */
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

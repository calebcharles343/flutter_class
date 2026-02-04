import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
    required this.deletefunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, right: 14.0, left: 14.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            Container(
              // margin: EdgeInsets.only(left: 5),
              child: SlidableAction(
                onPressed: deletefunction,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                // borderRadius: BorderRadius.circular(12),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: 0.0,
                ), // 👈 Add margin instead of Gap
                padding: const EdgeInsets.all(14.0),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: isTaskCompleted,
                          onChanged: onChanged,
                          activeColor: Colors.grey.shade800,
                        ),
                        Text(
                          taskName,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            decoration: isTaskCompleted
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.arrow_back),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text("Swipe"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Remove the Gap widget here
          ],
        ),
      ),
    );
  }
}

/*

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isTaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
    required this.deletefunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14.0, right: 14.0, left: 14.0),
      child: Slidable(
        // Close on tap when open
        closeOnScroll: true,
        
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletefunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ],
        ),
        
        // The main content that slides
        child: Container(
          padding: const EdgeInsets.all(14.0),
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
              topRight: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: isTaskCompleted,
                    onChanged: onChanged,
                    activeColor: Colors.grey.shade800,
                  ),
                  Text(
                    taskName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                      decoration: isTaskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.arrow_back),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("Swipe"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

 */

import 'add_task_list.dart';
import 'package:flutter/material.dart';

class PropertyDisplay extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  PropertyDisplay(
      {required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 5),
          Text('$label: $value'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: AddTasklist()));
}
// 
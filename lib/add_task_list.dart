import 'package:flutter/material.dart';

class AddTasklist extends StatefulWidget {
  const AddTasklist({super.key});

  @override
  State<AddTasklist> createState() => _AddTasklistState();
}

class _AddTasklistState extends State<AddTasklist> {
  final titleController = TextEditingController();
  final startDateController = TextEditingController();
  final dueDateController = TextEditingController();
  final repeatController = TextEditingController();
  final priorityController = TextEditingController();
  final locationController = TextEditingController();
  final reminderController = TextEditingController();
  final List<Map<String, dynamic>> tasks = [];

  Widget buildPropertyInput(
      IconData icon, String label, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ToDo List App'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Text(
                  'Add a New Task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              buildPropertyInput(
                Icons.title,
                'Title',
                titleController,
              ),
              buildPropertyInput(
                Icons.calendar_today,
                'Start Date',
                startDateController,
              ),
              buildPropertyInput(
                Icons.lock_clock,
                'Due Date',
                dueDateController,
              ),
              buildPropertyInput(
                Icons.repeat,
                'Repeat',
                repeatController,
              ),
              buildPropertyInput(
                Icons.flag,
                'Priority',
                priorityController,
              ),
              buildPropertyInput(
                Icons.location_on,
                'Location',
                locationController,
              ),
              buildPropertyInput(
                Icons.notifications,
                'reminder',
                reminderController,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    tasks.add({
                      'title': titleController.text,
                      'startDate': startDateController.text,
                      'dueDate': dueDateController.text,
                      'repeat': repeatController.text,
                      'priorityColor': priorityController.text,
                      'location': locationController.text,
                    });
                    setState(() {});
                  },
                  child: Text('Add Task'),
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildPropertyDisplay(IconData icon, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 10),
          Text('$label: $value'),
        ],
      ),
    );
  }
}

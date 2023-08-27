import 'package:flutter/material.dart';

class AddTasklist extends StatefulWidget {
  const AddTasklist({super.key});

  @override
  State<AddTasklist> createState() => _AddTasklistState();
}

class _AddTasklistState extends State<AddTasklist> {
  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Task name',
      'startDate': '2023-08-28',
      'dueDate': '2023-09-05',
      'repeat': 'Daily',
      'priorityColor': Colors.red,
      'location': 'Home',
      'subtasks': ['Subtask 1', 'Subtask 2'],
      'reminder': '1 hour before',
      // 'icon': Icons.check_circle,
    },
    // {
    //   'title': 'Task 2',
    //   'startDate': '2023-08-30',
    //   'dueDate': '2023-09-10',
    //   'repeat': 'Weekly',
    //   'priorityColor': Colors.green,
    //   'location': 'Office',
    //   'subtasks': ['Subtask 1'],
    //   'reminder': '30 minutes before',
    //   'icon': Icons.star,
    // },
    // Add more tasks as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List App'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];

          return ListTile(
            // leading: Icon(task['icon']),
            title: Text(task['title']),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //this is for start date
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today),
                      SizedBox(width: 5),
                      Text('Start Date: ${task['startDate']}'),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                  endIndent: 1,
                  indent: 1,
                ),
                //this is for the due date
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.lock_clock),
                      SizedBox(width: 5),
                      Text('Due Date: ${task['dueDate']}'),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                  endIndent: 1,
                  indent: 1,
                ),
                //this is for the repeat or loop
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.repeat),
                      SizedBox(width: 5),
                      Text('Repeat: ${task['repeat']}'),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                  endIndent: 1,
                  indent: 1,
                ),
                //this is for the priority
                Row(
                  children: [
                    Icon(Icons.priority_high),
                    SizedBox(width: 5),
                    Text('Priority:'),
                    //these radio buttons indicates wheather the task is important or not
                    Radio<String>(
                      value: 'High',
                      groupValue: task['priority'],
                      onChanged: (value) {
                        // Handle radio button selection
                      },
                    ),
                    Text('High'),
                    Radio<String>(
                      value: 'Medium',
                      groupValue: task['priority'],
                      onChanged: (value) {
                        // Handle radio button selection
                      },
                    ),
                    Text('Medium'),
                    Radio<String>(
                      value: 'Low',
                      groupValue: task['priority'],
                      onChanged: (value) {
                        // Handle radio button selection
                      },
                    ),
                    Text('Low'),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                  endIndent: 1,
                  indent: 1,
                ),
                //this is for location
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 5),
                      Text('Location: ${task['location']}'),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                  endIndent: 1,
                  indent: 1,
                ),
                //this is for sub task
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.playlist_add),
                      SizedBox(width: 5),
                      Text('Subtasks: ${task['subtasks'].join(", ")}'),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  height: 1,
                  thickness: 1,
                  endIndent: 1,
                  indent: 1,
                ),
                //this is for reminder
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(Icons.notifications),
                      SizedBox(width: 5),
                      Text('Reminder: ${task['reminder']}'),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

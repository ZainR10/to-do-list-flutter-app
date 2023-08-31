import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'add_task_list.dart';
import 'appfunctions.dart';

// class Task {
//   final String title;
//   final String description;
//   final DateTime startDate;
//   final TimeOfDay startTime;
//   final DateTime dueDate;
//   final TimeOfDay dueTime;
//   bool isCompleted; // Add the isCompleted property

//   Task({
//     required this.title,
//     required this.description,
//     required this.startDate,
//     required this.startTime,
//     required this.dueDate,
//     required this.dueTime,
//     this.isCompleted = false, // Initialize isCompleted to false by default
//   });
// }

class AppInitialScreen extends StatefulWidget {
  final List<Task> tasks;

  AppInitialScreen({required this.tasks});

  @override
  _AppInitialScreenState createState() => _AppInitialScreenState();
}

class _AppInitialScreenState extends State<AppInitialScreen> {
  List<Task> tasks = []; // Initialize the tasks list in the state
  bool isCompleted = false; // Add this line

  @override
  void initState() {
    super.initState();
    tasks = List.from(widget.tasks); // Initialize tasks from the widget
  }

  void _deleteTask(int index) {
    setState(() {
      deleteTask(tasks, index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Text('HI,'),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/profile pic.jpg'),
            radius: 20,
          ),
        ]),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color.fromARGB(0, 136, 8, 153),
        color: Color.fromARGB(120, 136, 9, 0),
        items: [Center(child: Icon(Icons.add))],
        onTap: (int index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTasklist(
                addTaskCallback: _addTask, // Correct function signature
              ),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          Task task = tasks[index];
          return ListTile(
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              Checkbox(
                shape: CircleBorder(eccentricity: 0),
                value: task.isCompleted, // Use task's isCompleted property
                onChanged: (newValue) {
                  setState(() {
                    task.isCompleted =
                        newValue!; // Update task's completion status
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => _deleteTask(index),
              )
            ]),
            title: Text(
              task.title,
              style: TextStyle(
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.description),
                SizedBox(height: 5),
                Text('Start Date: ${task.startDate.toString().split(' ')[0]}'),
                Text('Start Time: ${task.startTime.format(context)}'),
                Text('Due Date: ${task.dueDate.toString().split(' ')[0]}'),
                Text('Due Time: ${task.dueTime.format(context)}'),
              ],
            ),
          );
        },
      ),
    );
  }

  void _addTask(Task newTask) {
    setState(() {
      tasks.add(newTask); // Add the new task to the list
    });
  }
}

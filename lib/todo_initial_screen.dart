import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'add_task_list.dart';

class AppInitialScreen extends StatefulWidget {
  final List<Task> tasks;

  AppInitialScreen({required this.tasks});

  @override
  _AppInitialScreenState createState() => _AppInitialScreenState();
}

class _AppInitialScreenState extends State<AppInitialScreen> {
  List<Task> tasks = []; // Initialize the tasks list in the state

  @override
  void initState() {
    super.initState();
    tasks = List.from(widget.tasks); // Initialize tasks from the widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        actions: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.search),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.purpleAccent,
        items: [Center(child: Icon(Icons.add))],
        onTap: (int index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTasklist(
                addTaskCallback: _addTask,
              ),
            ),
          );
        },
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].title),
            subtitle: Text(tasks[index].description),
            // Display other task details as needed
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

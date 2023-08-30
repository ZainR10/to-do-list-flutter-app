import 'package:flutter/material.dart';
import 'package:flutter_application_1/todo_initial_screen.dart';
import 'appfunctions.dart';

// class Task {
//   final String title;
//   final String description;
//   final DateTime startDate;
//   final TimeOfDay startTime;
//   final DateTime dueDate;
//   final TimeOfDay dueTime;
//    bool isCompleted;

//   Task({
//     required this.title,
//     required this.description,
//     required this.startDate,
//     required this.startTime,
//     required this.dueDate,
//     required this.dueTime,
//      this.isCompleted = false,
//   });
// }

class AddTasklist extends StatefulWidget {
  final void Function(Task newTask)
      addTaskCallback; // Correct function signature

  AddTasklist({required this.addTaskCallback});
  @override
  State<AddTasklist> createState() => _AddTasklistState();
}

class _AddTasklistState extends State<AddTasklist> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime startDate = DateTime.now();
  TimeOfDay startTime = TimeOfDay.now();
  DateTime dueDate = DateTime.now();
  TimeOfDay dueTime = TimeOfDay.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: startDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(3000),
    );
    if (pickedDate != null && pickedDate != startDate) {
      setState(() {
        startDate = pickedDate;
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (pickedTime != null) {
      setState(() {
        startTime = pickedTime;
      });
    }
  }

  Future<void> _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: dueDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != dueDate) {
      setState(() {
        dueDate = pickedDate;
      });
    }
  }

  Future<void> _selectDueTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: dueTime,
    );
    if (pickedTime != null) {
      setState(() {
        dueTime = pickedTime;
      });
    }
  }

  void _addTask() {
    Task newTask = Task(
      title: titleController.text,
      description: descriptionController.text,
      startDate: startDate,
      startTime: startTime,
      dueDate: dueDate,
      dueTime: dueTime,
    );

    widget.addTaskCallback(newTask); // Call the callback in the parent screen

    Navigator.pop(context); // Navigate back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                //this is for title field
                controller: titleController,
                decoration: InputDecoration(labelText: 'Add Title'),
                // style: TextStyle(decoration:isCompleted? TextDecoration.lineThrough:),
              ),
              SizedBox(height: 50.0),
              TextField(
                //this is for description
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Add Description'),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectStartDate(context),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: TextEditingController(
                              text: startDate.toString().split(' ')[0]),
                          decoration: InputDecoration(labelText: 'Start Date'),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectStartDate(context),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectStartTime(context),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: TextEditingController(
                              text: startTime.format(context)),
                          decoration: InputDecoration(labelText: 'Start Time'),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => _selectStartTime(context),
                  ),
                ],
              ),
              SizedBox(height: 50.0),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDueDate(context),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: TextEditingController(
                              text: dueDate.toString().split(' ')[0]),
                          decoration: InputDecoration(labelText: 'Due Date'),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () => _selectDueDate(context),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _selectDueTime(context),
                      child: AbsorbPointer(
                        child: TextField(
                          controller: TextEditingController(
                              text: dueTime.format(context)),
                          decoration: InputDecoration(labelText: 'Due Time'),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.access_time),
                    onPressed: () => _selectDueTime(context),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
                child: ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add Task'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

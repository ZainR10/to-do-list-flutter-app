import 'package:flutter/material.dart';

class AddTasklist extends StatefulWidget {
  @override
  State<AddTasklist> createState() => _AddTasklistState();
}

class _AddTasklistState extends State<AddTasklist> {
  //to store title data
  TextEditingController titleController = TextEditingController();
  //to store description data
  TextEditingController descriptionController = TextEditingController();
  //it is  default time for each of the respective fields
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
                controller: titleController,
                decoration: InputDecoration(labelText: 'Add Title'),
              ),
              SizedBox(
                height: 50.0,
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Add Description'),
              ),
              SizedBox(height: 50.0),
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
            ],
          ),
        ),
      ),
    );
  }
}

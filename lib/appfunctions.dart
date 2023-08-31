import 'package:flutter/material.dart';

class Task {
  final String title;
  final String description;
  final DateTime startDate;
  final TimeOfDay startTime;
  final DateTime dueDate;
  final TimeOfDay dueTime;
  bool isCompleted; // Add the isCompleted property

  Task({
    required this.title,
    required this.description,
    required this.startDate,
    required this.startTime,
    required this.dueDate,
    required this.dueTime,
    this.isCompleted = false, // Initialize isCompleted to false by default
  });
}

void deleteTask(List<Task> tasks, int index) {
  tasks.removeAt(index);
}

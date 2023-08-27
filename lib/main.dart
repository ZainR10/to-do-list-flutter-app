import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_task_list.dart';
import 'todo_initial_screen.dart';
import 'themedata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appthemedata,
      debugShowCheckedModeBanner: false,
      home: const AppUi(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/add_task_list.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/signup.dart';
import 'todo_initial_screen.dart';
import 'themedata.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: themedata,
        debugShowCheckedModeBanner: false,
        home: const Login());
  }
}

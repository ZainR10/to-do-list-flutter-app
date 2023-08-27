import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppUi extends StatefulWidget {
  const AppUi({super.key});

  @override
  State<AppUi> createState() => _AppUiState();
}

class _AppUiState extends State<AppUi> {
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
      bottomNavigationBar:
          CurvedNavigationBar(backgroundColor: Colors.purpleAccent, items: [
        Center(child: Icon(Icons.add)),
      ]),
    );
  }
}

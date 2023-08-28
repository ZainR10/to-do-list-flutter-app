import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class AppInitialScreen extends StatefulWidget {
  const AppInitialScreen({super.key});

  @override
  State<AppInitialScreen> createState() => _AppInitialScreenState();
}

class _AppInitialScreenState extends State<AppInitialScreen> {
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

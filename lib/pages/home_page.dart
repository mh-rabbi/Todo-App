import 'package:flutter/material.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      body: ListView(
        children: [
          TodoTile(
            taskName: "Solve A Problem",
            isDone: true,
            onChanged: (p0) {},
          ),

          TodoTile(
            taskName: "Solve 2 Problem",
            isDone: false,
            onChanged: (p0) {},
          ),
        ],
      ),
    );
  }
}

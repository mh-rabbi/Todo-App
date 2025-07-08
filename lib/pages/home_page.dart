import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/dialog_box.dart';
import 'package:todo_app/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _todoBox = Hive.box('todo_box');

  ToDoDatabase db = ToDoDatabase(); // create an instance of the database

  @override
  void initState() {
    //if first time running the app, create initial data
    if (_todoBox.get('TODOLIST') == null) {
      db.createInitialData(); // create initial data
    }
    // if the app is ran before on the phone, load the data from the database
    else {
      db.loadData(); // load the data from the database
    }

    super.initState();
  }

  // text controller to get user input
  final _controller = TextEditingController();

  // checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase(); // update the database
  }

  // save new task method
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]); // add new task to the list
      _controller.clear(); // clear the text field
    });
    Navigator.of(context).pop(); // close the dialog box
    db.updateDatabase(); // update the database with the new task
  }

  // create new task method
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(), // cancel the view
        );
      },
    );
  }

  // delete task method
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index); // remove the task at the given index
    });
    db.updateDatabase(); // update the database after deletion
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Task deleted'), duration: Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        backgroundColor: Colors.yellow,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskName: db.toDoList[index][0],
            isDone: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}

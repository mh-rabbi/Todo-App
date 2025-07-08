import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  //reference the hive box
  final _todoBox = Hive.box('todo_box');

  // run this method when the app starts for the first time
  void createInitialData() {
    toDoList = [
      ["Solve A problem", false],
      ["Do exercise", false],
    ];
  }

  // load the data from the database
  void loadData() {
    toDoList = _todoBox.get('TODOLIST');
  }

  // update the database
  void updateDatabase() {
    _todoBox.put('TODOLIST', toDoList);
  }
}

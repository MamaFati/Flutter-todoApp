import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase {
  // reference our app
  List todoList = [];
  final _myBox = Hive.box('mybox');

  void creatInitialData() {
    // Run this when the user enters for the first time
    todoList = [
      ["complete TodoApp", false],
      ["Start project", false],
    ];
  }

  // load data from the dataBase
  void loadData() {
    var storedData = Hive.box('mybox').get('TODOLIST');
    if (storedData != null) {
      todoList = List<dynamic>.from(storedData);
    } else {
      todoList = [];
    }
  }

// update database
  void updateDataBase() {
    _myBox.put("TODOLIST", todoList);
  }
}

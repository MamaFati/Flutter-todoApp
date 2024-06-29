import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/util/Dailog_box.dart';
import 'package:todo_app/util/todotile.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  // reference the box
  final _myBox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();
  @override
  void initState() {
    // if first time opening the app display default settings
    if (_myBox.get("TODOLIST") == null) {
      db.creatInitialData();
    } else {
      // already exist
      db.loadData();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  // List of todo task
  // List todoList = [
  //   ["Complete todo app", false],
  //   ["learn flutter", false],
  // ];
  // create text box changed method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDataBase();
  }

  // save method
  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // Create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return dailogBox(
          controller: _controller,
          onSave: saveTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // Delete task
  void deleteTask(int index) {
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      // theme: ThemeData(
      //   textTheme: GoogleFonts.meriendaTextTheme(),
      // ),

      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColorLight,
        title: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25),
          child: Text(
            'To Do ',
            // style:
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        elevation: 0,
      ),
      // Add  floating action buttom
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),

      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            TaskName: db.todoList[index][0],
            TaskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}

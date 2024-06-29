import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Todo_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();
  // Open box
  // ignore: unused_local_variable
  var box = await Hive.openBox('mybox');
  //
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoApp(),
      // theme: ThemeData(primarySwatch: Colors.yellow),

      theme: ThemeData(
        textTheme: GoogleFonts.meriendaTextTheme(),
      ),
    );
  }
}

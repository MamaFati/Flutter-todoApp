import 'package:flutter/material.dart';
import 'package:todo_app/util/buttoms.dart';

// ignore: must_be_immutable
class dailogBox extends StatelessWidget {
  final controller;
  // save method
  VoidCallback onSave;
  VoidCallback onCancel;
  dailogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColorLight,
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              // This controller will make you have acess of the user input
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task ",
              ),
            ),
            //  Buttoms
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save Buttom
                my_buttom(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 10,
                ),
                // councle btn
                my_buttom(text: "Cancel", onPressed: onCancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}

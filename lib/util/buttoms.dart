import "package:flutter/material.dart";

// ignore: must_be_immutable
class my_buttom extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  my_buttom({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Color.fromARGB(255, 124, 163, 230),
      child: Text(text, 
      style: TextStyle(fontWeight:FontWeight.w600),
      ),
    );
  }
}

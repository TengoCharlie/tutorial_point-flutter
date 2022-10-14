import 'package:flutter/material.dart';

class Gesture extends StatelessWidget {
  Gesture({Key? key}) : super(key: key);

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("My Message in Alert Dialog"),
            content: const Text("Hello World from AlertDialog Box content"),
            actions: [
              TextButton(
                child: const Text("Close"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _showDialog(context);
        },
        child: const Text("Hello from gesture Detector"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  // controller to get user input
  const DialogBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // This dialog box will be used to add a new task
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add a new task",
                border: OutlineInputBorder(),
              ),
            ),

            //buttons = save and cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //save button
                MyButton(
                  text: "Save",
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  ),
                ),

                const SizedBox(width: 10), // spacing between buttons
                //cancel button
                MyButton(
                  text: "Cancel",
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MessageDisplay extends StatelessWidget {
  final String text;
  const MessageDisplay({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //Third of the size of the screen
      height: MediaQuery.of(context).size.height / 3,
      //text, and current information
      child: Center(
        child: SingleChildScrollView(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 25,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

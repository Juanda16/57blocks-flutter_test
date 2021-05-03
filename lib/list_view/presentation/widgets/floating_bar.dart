import 'package:flutter/material.dart';

class FloatingBar extends StatelessWidget {
  final String title;
  final bool isVisible;
  const FloatingBar({
    Key? key,
    this.isVisible = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: FloatingActionButton(
        //foregroundColor: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.pause,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.close,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(),
        onPressed: () {},
      ),
    );
  }
}

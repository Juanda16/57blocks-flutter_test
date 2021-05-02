import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        Icons.video_library,
      ),
      onPressed: () {},
    ),
    title: Text('My video app'),
    elevation: 30.0,
    actions: [
      IconButton(
          icon: const Icon(Icons.search),
          tooltip: 'Show Snackbar',
          onPressed: () {})
    ],
  );
}

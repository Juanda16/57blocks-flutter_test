import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/presentation/widgets/my_app_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/navigation_bar.dart';

class ExplorePage extends StatelessWidget {
  static const String id = 'explore_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          margin: EdgeInsets.only(
            top: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(),
              NavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}

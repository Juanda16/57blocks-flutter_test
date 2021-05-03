import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/presentation/widgets/my_app_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/navigation_bar.dart';

class SubscriptionPage extends StatelessWidget {
  static const String id = 'subscription_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: buildAppBar(),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Todo: Fake image w/ lack of implementation
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('images/subscriptions.jpeg'),
                    ),
                  ),
                ),
              ),
              NavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}

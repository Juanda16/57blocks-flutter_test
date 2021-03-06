import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/presentation/pages/explore_page.dart';
import 'package:my_video_app/list_view/presentation/pages/home_page.dart';
import 'injection_container.dart';
import 'list_view/presentation/pages/library_page.dart';
import 'list_view/presentation/pages/subscription_page.dart';
import 'list_view/presentation/pages/video_detail_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My video app',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColorDark: Colors.white24,
          secondaryHeaderColor: Colors.white),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        VideoDetailPage.id: (context) => VideoDetailPage(),
        ExplorePage.id: (context) => ExplorePage(),
        SubscriptionPage.id: (context) => SubscriptionPage(),
        LibraryPage.id: (context) => LibraryPage(),

        //        video: VideoEntity,
      },
    );
  }
}

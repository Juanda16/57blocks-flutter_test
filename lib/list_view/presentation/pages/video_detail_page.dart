import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/presentation/widgets/navigation_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/video_tail.dart';

class VideoDetailPage extends StatelessWidget {
  static const String id = 'video_detail_page';

  const VideoDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    final video = args.videoDetail;
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Container(
                              // Third of the size of the screen
                              height: MediaQuery.of(context).size.height / 4,
                              // Message Text widgets / CircularLoadingIndicator
                              child: Image.network(video.thumbnailsUrl),
                            ),
                            ListTile(
                              leading: Image.asset(
                                  'images/video-thumbnail-default.png'),
                              title: Text(video.id),
                              subtitle: Text(video.title),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      //VideoTile(video: video)
                    ],
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

class ScreenArguments {
  final VideoEntity videoDetail;
  ScreenArguments({required this.videoDetail});
}

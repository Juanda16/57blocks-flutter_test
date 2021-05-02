import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';

class VideoList extends StatelessWidget {
  final VideosDataEntity videosList;
  const VideoList({
    Key? key,
    required this.videosList,
  }) : super(key: key);

  //final List<String> entries;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 8, bottom: 8),
          itemCount: videosList.videos.length,
          itemBuilder: (context, index) {
            final video = videosList.videos[index];
            return Container(
              // height: 50,
              // color: Colors.amber[colorCodes[index]],
              // child: Center(child: Text('Entry ${entries[index]}')),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      // Third of the size of the screen
                      height: MediaQuery.of(context).size.height / 4,
                      // Message Text widgets / CircularLoadingIndicator
                      child: Image.network(video.thumbnailsUrl),
                    ),
                    ListTile(
                      leading:
                          Image.asset('images/video-thumbnail-default.png'),
                      title: Text(video.id),
                      subtitle: Text(video.title),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

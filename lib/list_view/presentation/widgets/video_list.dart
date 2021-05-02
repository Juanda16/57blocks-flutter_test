import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';
import 'package:my_video_app/list_view/presentation/widgets/video_tail.dart';

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
              child: VideoTile(video: video),
            );
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(
              Duration(seconds: 3)); // Fake server response time
          BlocProvider.of<ListViewBloc>(context).add(GetTrendingVideosEvent());
        },
        child: ListView.builder(
            padding: EdgeInsets.only(top: 2, bottom: 8),
            itemCount: videosList.videos.length,
            itemBuilder: (context, index) {
              final video = videosList.videos[index];
              return Container(
                color: Colors.white24,
                child: VideoTile(video: video),
              );
            }),
      ),
    );
  }
}

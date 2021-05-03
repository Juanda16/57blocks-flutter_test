import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';
import 'package:my_video_app/list_view/presentation/widgets/floating_bar.dart';

import 'get_image.dart';

class VideoTile extends StatefulWidget {
  const VideoTile({
    Key? key,
    required this.video,
  }) : super(key: key);

  final VideoEntity video;

  @override
  _VideoTileState createState() => _VideoTileState();
}

class _VideoTileState extends State<VideoTile> {
  @override
  Widget build(BuildContext context) {
    //bool like = widget.video.like;
    return Card(
      elevation: 15.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () async {
              final result = await Navigator.pushNamed(
                  context, VideoDetailPage.id,
                  arguments: ScreenArguments(videoDetail: widget.video));
              //BlocProvider.of<ListViewBloc>(context).add(PlayingVideoEvent());

              ScaffoldMessenger.of(context)
                ..removeCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text("$result playing"),
                ));
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: getImage(widget.video.thumbnailsUrl),
                ),
              ),
            ),
          ),
          buildListTile(),
        ],
      ),
    );
  }

  ListTile buildListTile() {
    return ListTile(
      //leading: Image.asset('images/video-thumbnail-default.png'),
      title: Text(widget.video.title),
      subtitle: Text(widget.video.channelTitle),
      trailing: Column(
        children: [
          Container(
            child: IconButton(
              //TODO: Get the like status from database depends on userAccount
              icon: Icon(
                widget.video.like ? Icons.favorite : Icons.favorite_border,
                color: widget.video.like ? Colors.red : null,
              ),
              onPressed: () {
                setState(() {
                  widget.video.like = !widget.video.like;
                  // BlocProvider.of<ListViewBloc>(context)
                  //     .add(GetTrendingVideosEvent());
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

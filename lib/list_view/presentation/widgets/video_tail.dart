import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:my_video_app/core/error/exceptions.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, VideoDetailPage.id,
                  arguments: ScreenArguments(videoDetail: widget.video));
            },
            child: Container(
              // Third of the size of the screen
              height: MediaQuery.of(context).size.height / 4,
              // Message Text widgets / CircularLoadingIndicator
              child: getImage(),
              //child: Image.asset('images/video-thumbnail-default.png'),
            ),
          ),
          ListTile(
            //leading: Image.asset('images/video-thumbnail-default.png'),
            title: Text(widget.video.title),
            subtitle: Text(widget.video.channelTitle),

            //trailing: LikeButton(),
            trailing: Column(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      widget.video.like
                          ? Icons.favorite
                          : Icons.favorite_border,
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
          ),
        ],
      ),
    );
  }

  Image getImage() {
    try {
      return Image.network(widget.video.thumbnailsUrl);
    } catch (exception) {
      print(exception);
      return Image.asset('images/video-thumbnail-default.png');
    }
  }
}
// return GestureDetector(
// onTap: () {
// Navigator.pushNamed(context, VideoDetailPage.id);
// },

// trailing: GestureDetector(
//   child: Icon(
//     // NEW from here...
//     like ? Icons.favorite : Icons.favorite_border,
//     color: like ? Colors.red : null,
//   ),
//   onTap: () {
//     // setState(() {
//     //   if (like) {
//     //     print('tapping');
//     //     like = false;
//     //   } else {
//     //     like = true;
//     //   }
//     });
//},

// onTap: () => Navigator.push(
//     context,
//     MaterialPageRoute(
//         builder: (context) => VideoDetailPage(
//               video: video,
//             ))),
// trailing: Icon(
//   like ? Icons.favorite : Icons.favorite_border,
//   color: like ? Colors.red : null,
// ),

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';

class VideoTile extends StatelessWidget {
  const VideoTile({
    Key? key,
    required this.video,
  }) : super(key: key);

  final VideoEntity video;

  @override
  Widget build(BuildContext context) {
    //bool like = widget.video.like;
    return Card(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, VideoDetailPage.id,
                  arguments: ScreenArguments(videoDetail: video));
            },
            child: Container(
              // Third of the size of the screen
              height: MediaQuery.of(context).size.height / 4,
              // Message Text widgets / CircularLoadingIndicator
              child: Image.network(video.thumbnailsUrl),
            ),
          ),
          ListTile(
            leading: Image.asset('images/video-thumbnail-default.png'),
            title: Text(video.id),
            subtitle: Text(video.title),

            //trailing: LikeButton(),
            trailing: Column(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(
                      video.like ? Icons.favorite : Icons.favorite_border,
                      color: video.like ? Colors.red : null,
                    ),
                    onPressed: () {
                      // setState(() {
                      video.like = !video.like;
                      // });
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

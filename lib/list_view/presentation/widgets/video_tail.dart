import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';

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
    var like = widget.video.like;
    return Card(
      child: Column(
        children: [
          Container(
            // Third of the size of the screen
            height: MediaQuery.of(context).size.height / 4,
            // Message Text widgets / CircularLoadingIndicator
            child: Image.network(widget.video.thumbnailsUrl),
          ),
          ListTile(
            leading: Image.asset('images/video-thumbnail-default.png'),
            title: Text(widget.video.id),
            subtitle: Text(widget.video.title),
            trailing: GestureDetector(
              child: Icon(
                // NEW from here...
                like ? Icons.favorite : Icons.favorite_border,
                color: like ? Colors.red : null,
              ),
              onTap: () {
                setState(() {
                  if (like) {
                    print('tapping');
                    like = false;
                  } else {
                    like = true;
                  }
                });
              },
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

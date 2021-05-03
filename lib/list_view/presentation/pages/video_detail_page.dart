import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/presentation/widgets/my_app_bar.dart';
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
      child: Scaffold(
        appBar: buildAppBar(),
        body: buildBody(context, video),
      ),
    );
  }

  Center buildBody(BuildContext context, VideoEntity video) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.down,
                    onDismissed: (_) {
                      //BlocProvider.of<ListViewBloc>(context).add(PlayingVideoEvent());
                      return Navigator.pop(context, video.title);
                    },
                    child: VideoTile(video: video),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
          NavigationBar(),
        ],
      ),
    );
  }
}

class ScreenArguments {
  final VideoEntity videoDetail;
  ScreenArguments({required this.videoDetail});
}

// Dismissible( //Working
// key: Key('1'),
// direction: DismissDirection.down,
// onDismissed: (_) => Navigator.pop(context),
// child: VideoTile(video: video)),

// DraggableScrollableSheet(builder: (BuildContext context,
//     ScrollController scrollController) {
// return VideoTile(video: video);
// })

// BlocBuilder<ListViewBloc, ListViewState>(
// builder: (context, state) {
// return

// return BlocProvider(
// create: (context) => sl<ListViewBloc>(),
// child:

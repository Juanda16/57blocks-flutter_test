import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';
import 'package:my_video_app/list_view/presentation/widgets/my_app_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/navigation_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/video_tail.dart';

import '../../../injection_container.dart';

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

  BlocProvider buildBody(BuildContext context, VideoEntity video) {
    return BlocProvider(
      create: (context) => sl<ListViewBloc>(),
      child: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    BlocBuilder<ListViewBloc, ListViewState>(
                        builder: (context, state) {
                      return Dismissible(
                        //Working
                        key: UniqueKey(),
                        direction: DismissDirection.down,
                        onDismissed: (_) {
                          BlocProvider.of<ListViewBloc>(context)
                              .add(PlayingVideoEvent());
                          return Navigator.pop(context);
                        },
                        //Navigator.pop(context),
                        child: VideoTile(video: video),
                      );
                    }),
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

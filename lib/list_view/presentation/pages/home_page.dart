import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_video_app/injection_container.dart';
import 'package:my_video_app/list_view/domain/entities/video_entity.dart';
import 'package:my_video_app/list_view/domain/entities/videos_data_entity.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';
import 'package:my_video_app/list_view/presentation/widgets/floating_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/loading_widget.dart';
import 'package:my_video_app/list_view/presentation/widgets/message_display.dart';
import 'package:my_video_app/list_view/presentation/widgets/my_app_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/navigation_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/video_list.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
    );
  }

  BlocProvider<ListViewBloc> buildBody(BuildContext context) {
    bool isPlaying = false;
    VideosDataEntity currentList;

    return BlocProvider(
      create: (context) => sl<ListViewBloc>(),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                child: BlocBuilder<ListViewBloc, ListViewState>(
                    builder: (context, state) {
                  if (state is Empty) {
                    print('empty sate');
                    BlocProvider.of<ListViewBloc>(context)
                        .add(GetTrendingVideosEvent());
                    return LoadingWidget();
                  } else if (state is Loading) {
                    print('Loading sate');
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    print('Loaded State');
                    currentList = state.listView;
                    return VideoList(
                      videosList: currentList,
                    );
                  } else if (state is Error) {
                    return MessageDisplay(text: state.message);
                  } else {
                    return MessageDisplay(text: 'error');
                  }
                }),
              ),
            ),
            FloatingBar(
              title: 'this tittle',
              isVisible: isPlaying,
            ),
            NavigationBar(),
          ],
        ),
      ),
    );
  }
}

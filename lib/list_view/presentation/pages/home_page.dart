import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_video_app/injection_container.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';
import 'package:my_video_app/list_view/presentation/widgets/loading_widget.dart';
import 'package:my_video_app/list_view/presentation/widgets/message_display.dart';
import 'package:my_video_app/list_view/presentation/widgets/navigation_bar.dart';
import 'package:my_video_app/list_view/presentation/widgets/video_list.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My video app'),
        elevation: 30.0,
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<ListViewBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ListViewBloc>(),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
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
                        //BlocProvider.of<ListViewBloc>(context).add(GetTrendingVideosEvent());
                        return LoadingWidget();
                      } else if (state is Loaded) {
                        print('Loaded State');
                        return VideoList(
                          videosList: state.listView,
                        );
                      } else if (state is Error) {
                        return MessageDisplay(text: state.message);
                      } else {
                        return MessageDisplay(text: 'error');
                      }
                    }),
                  ),
                ),
                NavigationBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// child: Container(
// child: Padding(
// padding: const EdgeInsets.only(top: 10, bottom: 10),
// child: VideoList(entries: entries),
// ),
// )

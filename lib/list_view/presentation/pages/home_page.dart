import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_video_app/injection_container.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';
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
    return BlocProvider(
      create: (context) => sl<ListViewBloc>(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
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
                      //BlocProvider.of<ListViewBloc>(context).add(GetTrendingVideosEvent());
                      return LoadingWidget();
                    } else if (state is Loaded) {
                      print('Loaded State');
                      return VideoList(
                        videosList: state.listView,
                      );
                    } else if (state is Playing) {
                      return FloatingBar(
                        isVisible: state.isPlaying,
                        title: 'is playing',
                      );
                    } else if (state is Error) {
                      return MessageDisplay(text: state.message);
                    } else {
                      return MessageDisplay(text: 'error');
                    }
                  }),
                ),
              ),
              // FloatingBar(
              //   title: 'this tittle',
              //   isVisible: true,
              // ),
              NavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingBar extends StatelessWidget {
  final String title;
  final bool isVisible;
  const FloatingBar({
    Key? key,
    this.isVisible = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: FloatingActionButton(
        //foregroundColor: Colors.grey.shade200,
        backgroundColor: Colors.grey.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 30,
            ),
            Icon(
              Icons.pause,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.close,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(),
        onPressed: () {},
      ),
    );
  }
}

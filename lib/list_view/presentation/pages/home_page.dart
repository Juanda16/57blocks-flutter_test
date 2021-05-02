import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_video_app/injection_container.dart';
import 'package:my_video_app/list_view/presentation/bloc/list_view_bloc.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';
import 'package:my_video_app/list_view/presentation/widgets/loading_widget.dart';
import 'package:my_video_app/list_view/presentation/widgets/message_display.dart';
import 'package:my_video_app/list_view/presentation/widgets/video_list.dart';

class HomePage extends StatelessWidget {
  static const String id = 'home_page';

  void _onItemTappedPage(int index, context) {
    switch (index) {
      case 0:
        HomePage();
        break;
      case 1:
        Navigator.pushNamed(context, VideoDetailPage.id);

        print(index);
        break;
      case 2:
        print(index);
        break;
      case 3:
        print(index);
        break;
      case 4:
        print(index);
        break;
      default:
        print(index);
        break;
    }
  }

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
    int _selectedIndex = 0;
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
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed, // This is all you need!
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.explore),
                      label: 'Explore',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_circle_outline),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.subscriptions_sharp),
                      label: 'Subscriptions',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.video_library),
                      label: 'Library',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  //onTap: _onItemTappedPage(_selectedIndex,context),
                )
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

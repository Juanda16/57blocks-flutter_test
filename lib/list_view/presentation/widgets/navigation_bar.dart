import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/presentation/pages/home_page.dart';
import 'package:my_video_app/list_view/presentation/pages/video_detail_page.dart';

class NavigationBar extends StatelessWidget {
  int _selectedIndex = 0;
  NavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      onTap: (_selectedIndex) {
        _onItemTappedPage(_selectedIndex, context);
      },
      //onTap: _onItemTappedPage(_selectedIndex,context),
    );
  }

  void _onItemTappedPage(int index, context) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, HomePage.id);
        break;
      case 1:
        //Navigator.pushNamed(context, VideoDetailPage.id);
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
}

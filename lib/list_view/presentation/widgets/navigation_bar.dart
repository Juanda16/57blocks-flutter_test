import 'package:flutter/material.dart';
import 'package:my_video_app/list_view/presentation/pages/explore_page.dart';
import 'package:my_video_app/list_view/presentation/pages/home_page.dart';
import 'package:my_video_app/list_view/presentation/pages/library_page.dart';
import 'package:my_video_app/list_view/presentation/pages/subscription_page.dart';

class NavigationBar extends StatelessWidget {
  final int _selectedIndex = 0;
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
        Navigator.popUntil(context, ModalRoute.withName(HomePage.id));
        //Navigator.pushNamed(context, HomePage.id);
        break;
      case 1:
        Navigator.pushNamed(context, ExplorePage.id);
        print(index);
        break;
      case 2:
        print(index);
        break;
      case 3:
        Navigator.pushNamed(context, SubscriptionPage.id);
        break;
      case 4:
        Navigator.pushNamed(context, LibraryPage.id);
        break;
      default:
        print('Error Button bar index: $index is the default option');
        Navigator.popUntil(context, ModalRoute.withName(HomePage.id));
        break;
    }
  }
}

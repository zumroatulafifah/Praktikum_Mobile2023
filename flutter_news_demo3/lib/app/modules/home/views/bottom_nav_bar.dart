import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app/modules/home/news/views/home_controllerAPI.dart';
import 'package:newsapp/app/modules/home/views/WebView.dart';
import 'package:newsapp/app/modules/home/views/discover_screen.dart';
import 'package:newsapp/app/modules/home/views/home_screen.dart';
// import 'package:newsapp/app/modules/home/controllers/WebView.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black.withAlpha(100),
      items: [
        BottomNavigationBarItem(
          icon: Container(
            margin: const EdgeInsets.only(left: 50),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              icon: const Icon(Icons.home),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, DiscoverScreen.routeName);
            },
            icon: const Icon(Icons.search),
          ),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, HomePage.routeName);
            },
            icon: const Icon(Icons.bookmarks),
          ),
          label: 'bookmarks',
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              // Handle the tap event here
              // For example, you can navigate to a new page using Navigator
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WebViewApp()));
            },
            child: Icon(CupertinoIcons.globe),
          ),
          label: 'Bookmarks',
        )
      ],
    );
  }
}

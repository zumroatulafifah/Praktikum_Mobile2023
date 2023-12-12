import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/app/modules/Dashboard/views/WebView.dart';
import 'package:flutter_firebase/app/modules/Dashboard/views/discover_screen.dart';
import 'package:flutter_firebase/app/modules/Login/views/home_page.dart';
import 'package:flutter_firebase/app/modules/News/views/home_controllerAPI.dart';
import 'package:flutter_firebase/app/modules/Profil/views/signup_screen.dart';

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
                Navigator.pushNamed(context, HomePage.routeName);
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
              Navigator.pushNamed(context, HomeAPI.routeName);
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
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              // Navigate to the profile page
              // Replace 'ProfilePage' with the actual route name for the profile page
              Navigator.pushNamed(context, SignUpScreen.routeName);
            },
            icon: const Icon(Icons.newspaper),
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}

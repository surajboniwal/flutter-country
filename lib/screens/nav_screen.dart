import 'package:country_list/screens/explore_screen.dart';
import 'package:country_list/screens/bookmark_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key key, this.internet = true}) : super(key: key);
  final bool internet;
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  final _screens = const [
    ExploreScreen(),
    BookmarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.internet == false ? 1 : _selectedIndex,
        onTap: (index) {
          if (widget.internet == false && index == 0) {
            Get.snackbar('Internet error', 'Please connect to internet and restart app');
          }
          setState(() => _selectedIndex = index);
        },
        selectedFontSize: 12.0,
        unselectedFontSize: 12.0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Expolore',
            activeIcon: Icon(Icons.explore),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_outline),
            label: 'Bookmark',
            activeIcon: Icon(Icons.bookmark),
          ),
        ],
      ),
      body: Stack(
        children: _screens
            .asMap()
            .map(
              (index, screen) => MapEntry(
                index,
                Offstage(
                  child: screen,
                  offstage: _selectedIndex != index,
                ),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}

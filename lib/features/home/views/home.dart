import 'package:community_app/common/colors.dart';
import 'package:community_app/common/paths.dart';
import 'package:community_app/features/bookmark/views/bookmark.dart';
import 'package:community_app/features/browse/views/browse.dart';
import 'package:community_app/features/dashboard/views/dashboard.dart';
import 'package:community_app/features/more/view/more.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> list = [
    const Discover(),
    const Browse(),
    const Bookmark(),
    const More(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: list[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(color: greyColor),
          currentIndex: _currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(homeDeactiveSvg),
              activeIcon: SvgPicture.asset(homeActiveSvg),
              label: "Discover",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(browseDeactiveSvg),
                activeIcon: SvgPicture.asset(browseActiveSvg),
                label: "Browse"),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(bookmarkDeactiveSvg),
              activeIcon: SvgPicture.asset(browseActiveSvg),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset(profileDeactiveSvg),
                activeIcon: SvgPicture.asset(profileActiveSvg),
                label: "More"),
          ],
        ),
      ),
    );
  }
}

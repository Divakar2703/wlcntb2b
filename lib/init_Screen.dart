import 'dart:math';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:challenge_infracea/pages/search/search_page.dart';
import 'package:challenge_infracea/pages/trips/trips_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  State<InitScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<InitScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 1);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 1);

  int maxCount = 3;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    TripsPage(),
    SearchPage(),
    const Page3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
        /// Provide NotchBottomBarController
        notchBottomBarController: _controller,
        color: Colors.white,
        showLabel: false,
        shadowElevation: 5,
        kBottomRadius: 28.0,
        // notchShader: const SweepGradient(
        //   startAngle: 0,
        //   endAngle: pi / 2,
        //   colors: [Colors.red, Colors.green, Colors.orange],
        //   tileMode: TileMode.mirror,
        // ).createShader(Rect.fromCircle(center: Offset.zero, radius: 8.0)),
        // notchColor: Colors.black87,

        /// restart app if you change removeMargins
        removeMargins: false,
        bottomBarWidth: 500,
        durationInMilliSeconds: 300,
        bottomBarItems: [

          const BottomBarItem(
            inActiveItem: Icon(
              Icons.settings,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.settings,
              color: Colors.pink,
            ),
            itemLabel: 'Page 4',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.home_filled,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.home_filled,
              color: Colors.blueAccent,
            ),
            itemLabel: 'Page 1',
          ),
          const BottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.blueGrey,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.yellow,
            ),
            itemLabel: 'Page 5',
          ),
        ],
        onTap: (index) {
          /// perform action on tab change and to update pages you can update pages without pages
          // log('current selected index $index');
          _pageController.jumpToPage(index);
        },
        kIconSize: 24.0,
      )
          : null,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.green, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

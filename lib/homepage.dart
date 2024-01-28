import 'package:unispace/Feed.dart';
import 'package:unispace/utils.dart';

import 'Announcements.dart';
import 'Classes.dart';
import 'Profile.dart';
import 'piechart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Menu.dart';
import 'bottomNavBar.dart';
import 'feedBadges.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Your main content goes here
            buildPageView(),

            // Positioned with BottomNav as a child
            Positioned(
              left: 30,
              right: 30,
              bottom: 10,
              child: Container(
                color: Colors.transparent,
                child: BottomNav(pageController: _pageController),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPageView() {
    return PageView(
      controller: _pageController,
      children: [
        // Replace with your pages
        buildPage1(),
        buildPage2(),
        buildPage3(),
        UserProfile(),
      ],
    );
  }

  Widget buildPage1() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: Container(
                    height: 35,
                    child: Image.asset("assets/images/menu.png"),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 30,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        //Get.to(SearchPage());
                      },
                      child: const Icon(
                        CupertinoIcons.mail,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Good Morning,",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Aymaan",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20),
            child: Row(
              children: [
                Text(
                  "Top Feed",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'See all',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => const Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 18),
                  child: feedHomebadge(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 20),
            child: Row(
              children: [
                Text(
                  "Announcements",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Text(
                    'See all',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                3,
                (index) => const Padding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 18),
                  child: announcements(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Attendance",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: pieChart(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 120,
                      height: 40,
                      decoration: Utils.decoration,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      decoration: Utils.decoration,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 120,
                      height: 40,
                      decoration: Utils.decoration,
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }

  Widget buildPage2() {
    // Replace with your implementation for the second page
    return Feeds();
  }

  Widget buildPage3() {
    // Replace with your implementation for the third page
    return Classes();
  }
}

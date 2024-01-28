import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late int focus;

  @override
  void initState() {
    super.initState();
    focus = widget.pageController.initialPage; // Set initial focus
    widget.pageController.addListener(_pageControllerListener);
  }

  void _pageControllerListener() {
    final currentPage = widget.pageController.page?.round();
    if (currentPage != null && currentPage != focus) {
      if (mounted) {
        setState(() {
          focus = currentPage;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageControllerListener);
    super.dispose();
  }

  List<String> navItems = ['Home', 'Feed', 'Class', 'Profile'];
  List<String> icons = ['home', 'feed', 'class', 'user'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.096,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
              (index) => GestureDetector(
            onTap: () {
              if (!mounted) return; // Check if the widget is mounted
              widget.pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: focus == index ? 0.0 : 1.0,
                end: focus == index ? 1.0 : 0.0,
              ),
              builder: (context, alpha, child) {
                return CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orange.withOpacity(alpha),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Image.asset('assets/bottomNav/${icons[index]}.png'),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

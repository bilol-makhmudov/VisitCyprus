import 'package:flutter/material.dart';
import 'package:visit_cyprus/screens/everything/EverythingScreen.dart';
import 'package:visit_cyprus/screens/profile/profile_screen.dart';

import '../../Widgets/BottomNavigationBarCustom.dart';
import '../../config/theme.dart';
import '../locations/locations.dart';
import '../map/map_screen.dart';
import '../tips/TipsScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = "/home";

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => HomeScreen(), settings: RouteSettings(name: routeName));
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.blueGrey, size: 30),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text(
            "Home",
            style: TextStyle(color: Colors.blueGrey, fontSize: 25),
          ),
          actions: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 22,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/traveler.png"),
                ),
              ),
            )
          ],
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          children: [
            EverythingScreen(),
            LocationsScreen(),
            TipsScreen(),
            ProfileScreen()
          ],
        ),
        bottomNavigationBar: BottomNavigationBarCustom(
          currentPage: pageIndex,
          onPageChanged: (newPageIndex) {
            setState(() {
              pageIndex = newPageIndex;
              _pageController.animateToPage(pageIndex,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            });
          },
        ),
      ),
    );
  }
}

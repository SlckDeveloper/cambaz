import 'package:cambaz/utilities/bottom_navigation_bar_screen_names.dart';
import 'package:cambaz/utilities/fixed_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAMBAZ',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'CAMBAZ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();

  }

  void navigationTapped(int value) {
    pageController.jumpToPage(value);
  }

  void onPageChanged(int value) {
    setState(() {
      _page = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      body: PageView(
        onPageChanged: onPageChanged,
        controller: pageController,
        children: bottomNavigationBarScreenNames,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _page == 0 ? selectedBNB : unselectedBNB,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              color: _page == 1 ? selectedBNB : unselectedBNB,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: _page == 2 ? selectedBNB : unselectedBNB,
            ),
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}

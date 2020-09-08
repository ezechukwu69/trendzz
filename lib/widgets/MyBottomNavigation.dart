import 'package:flutter/material.dart';

class MyBottomNavigation extends StatelessWidget {
  const MyBottomNavigation({
    Key key,
    @required this.currentIndex,
    @required this.updateIndex,
  }) : super(key: key);

  final int currentIndex;
  final Function updateIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        elevation: 0,
        currentIndex: currentIndex,
        onTap: updateIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Search")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Tv series"))
        ]);}}
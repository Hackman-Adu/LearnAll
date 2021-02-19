import 'package:flutter/material.dart';
import 'package:tutorialsApp/screens/home.dart';

class BottomNavigationPages {
  String appBarTitle;
  Widget page;
  BottomNavigationPages({this.appBarTitle, this.page});

  List<BottomNavigationPages> getPages() {
    return [
      BottomNavigationPages(page: Home(), appBarTitle: "Learn All"),
      BottomNavigationPages(
          page: Container(
            child: Center(
              child: Text("My Account"),
            ),
          ),
          appBarTitle: "My Account"),
      BottomNavigationPages(
          page: Container(
            child: Center(
              child: Text("Settings"),
            ),
          ),
          appBarTitle: "Settings")
    ];
  }
}

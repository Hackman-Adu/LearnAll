import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutorialsApp/models/bottomNavigationPages.dart';

class StartScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartScreenState();
  }
}

class StartScreenState extends State<StartScreen> {
  List<MenutItems> menuItems = MenutItems().getMenuItems();
  List<BottomNavigationPages> pages = BottomNavigationPages().getPages();
  int pageIndex = 0;
  String firstName = "Hackman";
  String lastName = "Adu Gyamfi";
  var scaffoldKey = GlobalKey<ScaffoldState>();

  void showbottomSheet(BuildContext context) {
    showModalBottomSheet(
        barrierColor: Theme.of(context).primaryColor.withOpacity(0.87),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7), topRight: Radius.circular(7))),
        context: context,
        builder: (context) {
          return Container(
              child: Wrap(
                  children: this.menuItems.map((item) {
            return ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: Text(
                item.name,
                style: TextStyle(
                    fontSize: 17,
                    color: Theme.of(context).primaryColor.withOpacity(0.95)),
              ),
              leading: Icon(
                item.icon,
                color: Theme.of(context).primaryColor,
              ),
            );
          }).toList()));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: this.scaffoldKey,
      appBar: AppBar(
        title: Text(this.pages[this.pageIndex].appBarTitle),
        bottom: this.pageIndex == 0
            ? PreferredSize(
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                        child: Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          "assets/images/profileImage.jpg")),
                                  color: Colors.white,
                                  shape: BoxShape.circle),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome",
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white.withOpacity(0.75)),
                                ),
                                Container(
                                    width: double.infinity,
                                    child: Text(
                                      "${this.firstName} ${this.lastName}",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Colors.white.withOpacity(0.95)),
                                    ))
                              ],
                            )),
                            Padding(
                              padding: EdgeInsets.only(left: 21),
                              child: IconButton(
                                splashRadius: 25,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ))),
                preferredSize: Size.fromHeight(60),
              )
            : null,
        actions: [
          this.pageIndex == 0
              ? IconButton(
                  splashRadius: 23,
                  onPressed: () {
                    this.showbottomSheet(context);
                  },
                  icon: Icon(Icons.more_horiz),
                )
              : Container()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this.pageIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            this.pageIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon:
                  Icon(Platform.isAndroid ? Icons.home : CupertinoIcons.home)),
          BottomNavigationBarItem(
              label: "My Account",
              icon: Icon(
                  Platform.isAndroid ? Icons.person : CupertinoIcons.person)),
          BottomNavigationBarItem(
              label: "Settings",
              icon: Icon(Platform.isAndroid
                  ? Icons.settings
                  : CupertinoIcons.settings))
        ],
      ),
      body: this.pages[this.pageIndex].page,
    );
  }
}

class MenutItems {
  String name;
  IconData icon;
  MenutItems({this.name, this.icon});
  List<MenutItems> getMenuItems() {
    return [
      MenutItems(name: "Help", icon: Icons.help),
      MenutItems(name: "Contact Us", icon: Icons.email),
      MenutItems(name: "Share App", icon: Icons.share)
    ];
  }
}

import 'package:flutter/material.dart';
import 'package:tutorialsApp/models/courseCategories.dart';
import 'package:tutorialsApp/screens/quizzes.dart';
import 'package:tutorialsApp/screens/studentMaterialsPages.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<CourseCategories> courses = CourseCategories().getCourses();
  String layoutType = "grid";
  AnimationController animationController;
  Animation<double> animation;
  CurvedAnimation curve;

  void navigation(String location, BuildContext context) {
    if (location == "learning programming") {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StudentMaterialsPage()));
    } else if (location == "quizzes") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => QuizzesPage()));
    }
  }

  TextStyle titleStyles() {
    return TextStyle(
        color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold);
  }

  Widget buildCardViewLayout() {
    return GridView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 1.5,
          crossAxisSpacing: 7,
          mainAxisSpacing: 7,
          maxCrossAxisExtent: 300),
      itemCount: this.courses.length,
      itemBuilder: (context, index) {
        var course = this.courses[index];
        return ScaleTransition(
            scale: this.animation,
            child: InkWell(
                borderRadius: BorderRadius.circular(7),
                onTap: () {
                  this.navigation(course.location, context);
                },
                child: Container(
                    child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  color: course.backgroundColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          course.icon,
                          size: 43,
                          color: Colors.white,
                        ),
                        SizedBox(height: 10),
                        Text(
                          course.title,
                          style: this.titleStyles(),
                        ),
                      ],
                    ),
                  ),
                ))));
      },
    );
  }

  Widget buildListViewLayout() {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: this.courses.length,
      itemBuilder: (context, index) {
        var course = this.courses[index];
        return ScaleTransition(
            scale: this.animation,
            child: ListTile(
              onTap: () {
                this.navigation(course.location, context);
              },
              trailing: Icon(
                Icons.chevron_right,
                color: Colors.grey,
              ),
              title: Text(
                course.title,
                style: TextStyle(fontSize: 17),
              ),
              leading: Icon(
                course.icon,
                color: course.backgroundColor,
              ),
            ));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    this.animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 250));
    this.curve = new CurvedAnimation(
        curve: Curves.bounceInOut, parent: this.animationController);
    this.animation = Tween<double>(begin: 0.0, end: 1.0).animate(this.curve);
    this.animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    this.animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Card(
                  shadowColor: Colors.black.withOpacity(0.35),
                  elevation: 25,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Row(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "Quick Access",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.9),
                                  fontSize: 15),
                            )),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.accessibility,
                          color: Theme.of(context).primaryColor,
                        ),
                        Spacer(),
                        IconButton(
                          splashRadius: 20,
                          onPressed: () {
                            setState(() {
                              this.layoutType =
                                  this.layoutType == "grid" ? "list" : "grid";
                              this.animationController.reset();
                              this.animationController.forward();
                            });
                          },
                          icon: Icon(
                            this.layoutType == "grid"
                                ? Icons.list
                                : Icons.dashboard,
                            color: Theme.of(context).primaryColor,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                this.layoutType == "grid"
                    ? this.buildCardViewLayout()
                    : this.buildListViewLayout(),
                Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 25),
                  child: Text(
                    "Verion 1.0.1",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                )
              ],
            )));
  }
}

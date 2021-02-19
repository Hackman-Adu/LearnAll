import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tutorialsApp/models/quizzesFeed.dart';

class QuizzesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizzesState();
  }
}

class QuizzesState extends State<QuizzesPage>
    with SingleTickerProviderStateMixin {
  bool hasScrolledTop = false;
  ScrollController scrollController;
  List<Quizzes> quizzes = Quizzes().getQuizzes();
  List<Quizzes> allQuizzes = Quizzes().getQuizzes();
  var controller = new TextEditingController();
  String query = "";

  void searchingLanguages() {
    setState(() {
      if (query.trim() == "") {
        this.quizzes = this.allQuizzes;
        return;
      }
      this.quizzes = this.allQuizzes.where((quiz) {
        return quiz.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Widget searchInputField() {
    return Padding(
        padding: EdgeInsets.fromLTRB(7, 7, 7, 13),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 25,
          shadowColor: Colors.black.withOpacity(0.25),
          child: Padding(
              padding: EdgeInsets.only(top: 3, bottom: 3, left: 17, right: 3),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor.withOpacity(0.65),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Expanded(
                      child: TextFormField(
                    controller: this.controller,
                    onChanged: (value) {
                      setState(() {
                        this.query = value;
                      });
                      this.searchingLanguages();
                    },
                    style: TextStyle(
                        fontSize: 17, color: Colors.black.withOpacity(0.65)),
                    decoration: InputDecoration(
                        hintText: "Search language...",
                        border: InputBorder.none),
                  )),
                  IconButton(
                    splashRadius: 17,
                    onPressed: () {
                      setState(() {
                        if (this.controller.text.trim() != "") {
                          this.controller.text = "";
                          this.quizzes = this.allQuizzes;
                        }
                      });
                    },
                    icon: Icon(
                      Icons.close,
                      color: Theme.of(context).primaryColor.withOpacity(0.65),
                    ),
                  ),
                  SizedBox(
                    width: 3,
                  )
                ],
              )),
        ));
  }

  @override
  void initState() {
    super.initState();
    this.scrollController = new ScrollController();
    this.scrollController.addListener(() {
      if (this.scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          this.hasScrolledTop = false;
        });
      } else if (this.scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          this.hasScrolledTop = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Quizzes Feed"),
          bottom: this.hasScrolledTop == false
              ? PreferredSize(
                  preferredSize: Size.fromHeight(80),
                  child: this.searchInputField())
              : null,
        ),
        body: SingleChildScrollView(
            controller: this.scrollController,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: this.quizzes.length > 0
                  ? GridView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(vertical: 7),
                      itemCount: this.quizzes.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3,
                          maxCrossAxisExtent: 300),
                      itemBuilder: (context, index) {
                        var quiz = this.quizzes[index];
                        return InkWell(
                            onTap: () {},
                            child: Card(
                              elevation: 25,
                              color: Colors.white,
                              shadowColor: Colors.black.withOpacity(0.35),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: EdgeInsets.all(25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      quiz.title,
                                      style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black.withOpacity(0.85),
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      "${quiz.numberOfQuestions.toString()} Questions - language basics",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FlatButton(
                                      onPressed: () {},
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      textColor: Colors.white,
                                      minWidth: double.infinity,
                                      child: Text("Browse"),
                                      height: 45,
                                      color: Theme.of(context).primaryColor,
                                    )
                                  ],
                                ),
                              ),
                            ));
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                          child: Text('No results found for "${this.query}"'))),
            )));
  }
}

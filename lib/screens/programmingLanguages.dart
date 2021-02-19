import 'package:flutter/material.dart';
import 'package:tutorialsApp/models/quizzesFeed.dart';
import 'package:tutorialsApp/screens/languagesDetails.dart';

class CustomSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomSearchState();
  }
}

class CustomSearchState extends State<CustomSearch> {
  List<Quizzes> programmingLanguages;
  List<Quizzes> suggestedProgrammingLanguages;
  String query = "";
  var controller = new TextEditingController();
  List<String> levels = ["All", "Beginner", "Intermediate", "Advance"];
  int selectedLevel = 0;
  @override
  void initState() {
    super.initState();
    this.suggestedProgrammingLanguages = Quizzes().getQuizzes();
    this.programmingLanguages = Quizzes().getQuizzes();
  }

  void searching(String text) {
    setState(() {
      if (text.trim() == "") {
        this.suggestedProgrammingLanguages = this.programmingLanguages;
      } else {
        this.suggestedProgrammingLanguages =
            this.programmingLanguages.where((quiz) {
          return quiz.title.toLowerCase().contains(text.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: this.selectedLevel == 0
              ? Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width: 7,
                    ),
                    Expanded(
                        child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          this.query = value;
                        });
                        this.searching(this.query);
                      },
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      keyboardType: TextInputType.text,
                      controller: this.controller,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle:
                              TextStyle(color: Colors.white, fontSize: 17)),
                    ))
                  ],
                )
              : Text(this.levels[this.selectedLevel]),
          actions: [
            this.selectedLevel == 0
                ? IconButton(
                    splashRadius: 23,
                    onPressed: () {
                      setState(() {
                        this.query = "";
                        this.controller.text = "";
                        this.suggestedProgrammingLanguages =
                            this.programmingLanguages;
                      });
                    },
                    icon: Icon(Icons.close),
                  )
                : Container()
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 7),
              height: 60,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: this.levels.length,
                itemBuilder: (context, index) {
                  var level = this.levels[index];
                  return InkWell(
                      borderRadius: BorderRadius.circular(25),
                      onTap: () {
                        setState(() {
                          this.selectedLevel = index;
                          this.suggestedProgrammingLanguages = level == "All"
                              ? this.programmingLanguages
                              : this.programmingLanguages.where((language) {
                                  return language.level.toLowerCase() ==
                                      level.toLowerCase();
                                }).toList();
                        });
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            color: selectedLevel == index
                                ? Theme.of(context).primaryColor
                                : Colors.transparent),
                        margin: EdgeInsets.all(10),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child: Center(
                            child: Text(
                              level.toUpperCase(),
                              style: TextStyle(
                                  color: selectedLevel == index
                                      ? Colors.white
                                      : Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.85)),
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
            suggestedProgrammingLanguages.length != 0
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    itemCount: suggestedProgrammingLanguages.length,
                    itemBuilder: (context, index) {
                      var language = suggestedProgrammingLanguages[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LearnLanguages(
                                        selectedLanguage: language.title,
                                      )));
                        },
                        trailing: Icon(
                          Icons.chevron_right,
                          color: Colors.grey,
                        ),
                        leading: Icon(Icons.code_outlined,
                            size: 20, color: Theme.of(context).primaryColor),
                        title: Text(
                          language.title,
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                    child: Text(
                        'Nothing found for "${this.query}\nCheck again later',
                        textAlign: TextAlign.center),
                  )),
          ],
        )));
  }
}

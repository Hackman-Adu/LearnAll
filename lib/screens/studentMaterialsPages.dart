import 'package:flutter/material.dart';
import 'package:tutorialsApp/models/studentMaterials.dart';
import 'package:tutorialsApp/screens/learnOthers.dart';
import 'package:tutorialsApp/screens/programmingLanguages.dart';

class StudentMaterialsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StudentMaterialsPageState();
  }
}

class StudentMaterialsPageState extends State<StudentMaterialsPage>
    with SingleTickerProviderStateMixin {
  List<StudentMaterials> courseMaterials =
      StudentMaterials().getStudentMaterials();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Learn Programming"),
        ),
        body: ListView.builder(
          padding: EdgeInsets.only(top: 13),
          itemCount: this.courseMaterials.length,
          itemBuilder: (context, index) {
            var material = this.courseMaterials[index];
            return Container(
              margin: EdgeInsets.symmetric(vertical: 7),
              child: ListTile(
                onTap: () {
                  if (material.title == "Programming Languages") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CustomSearch()));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LearnOthers(
                                  selectedTopic: material.title,
                                )));
                  }
                },
                subtitle: Text(
                  material.subtitle,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black.withOpacity(0.5)),
                ),
                leading: Icon(
                  material.icon,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
                title: Text(
                  material.title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
            );
          },
        ));
  }
}

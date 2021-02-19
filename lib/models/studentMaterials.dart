import 'package:flutter/material.dart';

class StudentMaterials {
  String title;
  String subtitle;
  IconData icon;
  StudentMaterials({
    this.title,
    this.subtitle,
    this.icon,
  });
  List<StudentMaterials> getStudentMaterials() {
    return [
      StudentMaterials(
          title: "Programming Introduction",
          subtitle: "Explore the general concept of programming",
          icon: Icons.code_outlined),
      StudentMaterials(
          title: "Algorithms",
          subtitle: "Understand what algorithms are",
          icon: Icons.psychology_outlined),
      StudentMaterials(
          title: "Data Structures",
          subtitle: "Understand what data structures are",
          icon: Icons.account_tree_outlined),
      StudentMaterials(
          title: "Programming Languages",
          subtitle: "Learn various programming languages",
          icon: Icons.code_outlined),
    ];
  }
}

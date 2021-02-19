import 'package:flutter/material.dart';

class CourseCategories {
  String title;
  IconData icon;
  String location;
  Color backgroundColor;
  CourseCategories(
      {this.title, this.icon, this.location, this.backgroundColor});

  List<CourseCategories> getCourses() {
    return [
      CourseCategories(
        backgroundColor: Color(0XFF1e81b0),
        location: "learning programming",
        title: "Learn Programming",
        icon: Icons.code_rounded,
      ),
      CourseCategories(
        backgroundColor: Color(0XFF063970),
        location: "quizzes",
        title: "Quizzes Feed",
        icon: Icons.question_answer_rounded,
      ),
      CourseCategories(
        backgroundColor: Color(0XFF53858C),
        location: "Leader Board",
        title: "Leader Board",
        icon: Icons.emoji_events_rounded,
      ),
      CourseCategories(
        backgroundColor: Color(0XFF154c79),
        location: "interview",
        title: "Interview Q & A",
        icon: Icons.record_voice_over_rounded,
      ),
      CourseCategories(
        backgroundColor: Color(0XFF53858C),
        location: "bookmarks",
        title: "Bookmarks",
        icon: Icons.bookmark_rounded,
      ),
      CourseCategories(
        backgroundColor: Color(0XFF53858C),
        location: "invitation",
        title: "Invite Friends",
        icon: Icons.person_add_rounded,
      ),
      CourseCategories(
        backgroundColor: Color(0XFF154c79),
        location: "feedback",
        title: "Feedback",
        icon: Icons.insert_comment_rounded,
      ),
      CourseCategories(
        backgroundColor: Color(0XFF1e81b0),
        location: "Rate",
        title: "Rate",
        icon: Icons.rate_review_rounded,
      ),
    ];
  }
}

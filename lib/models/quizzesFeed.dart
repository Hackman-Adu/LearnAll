class Quizzes {
  String title;
  int numberOfQuestions;
  String level;
  Quizzes({this.title, this.numberOfQuestions, this.level});

  List<Quizzes> getQuizzes() {
    List<Quizzes> quizzes = [
      Quizzes(title: "JAVA", numberOfQuestions: 25, level: "advance"),
      Quizzes(title: "PYTHON", numberOfQuestions: 40, level: "advance"),
      Quizzes(
          title: "JAVASCRIPT", numberOfQuestions: 35, level: "intermediate"),
      Quizzes(title: "PHP", numberOfQuestions: 50, level: "advance"),
      Quizzes(title: "HTML", numberOfQuestions: 25, level: "Beginner"),
      Quizzes(title: "CSS", numberOfQuestions: 25, level: "beginner"),
      Quizzes(title: "DART", numberOfQuestions: 50, level: "intermediate"),
      Quizzes(title: "C#", numberOfQuestions: 25, level: "advance"),
      Quizzes(title: "ANGULAR", numberOfQuestions: 50, level: "intermediate"),
      Quizzes(title: "REACT", numberOfQuestions: 25, level: "beginner"),
      Quizzes(title: "BOOTSTRAP", numberOfQuestions: 50, level: "beginner"),
      Quizzes(title: "SQL", numberOfQuestions: 25, level: "intermediate"),
      Quizzes(title: "JQUERY", numberOfQuestions: 50, level: "beginner"),
      Quizzes(title: "XML", numberOfQuestions: 25, level: "intermediate"),
    ];
    quizzes.sort((a, b) {
      return a.title.compareTo(b.title);
    });
    return quizzes;
  }
}

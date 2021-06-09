import 'package:DevQuiz/shared/model/question_model.dart';

enum Level {
  FACIL,
  MEDIO,
  DIFICIL,
  PERITO,
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAwnsered;
  final String image;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.questionAwnsered = 0,
      required this.image,
      required this.level})
      : assert(questions.length > 0);
}

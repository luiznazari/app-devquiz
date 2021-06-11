import 'dart:convert';

import 'package:DevQuiz/shared/model/question_model.dart';

enum Level {
  FACIL,
  MEDIO,
  DIFICIL,
  PERITO,
}

// extension LevelExt on Level {
//   Level get toStrin => {
//     this.toString()
//         "FACIL": Level.FACIL,
//         "MEDIO": Level.MEDIO,
//         "DIFICIL": Level.DIFICIL,
//         "PERITO": Level.PERITO,
//       }[this]!;
// }

Level parseLevel(String key) {
  return {
    "FACIL": Level.FACIL,
    "MEDIO": Level.MEDIO,
    "DIFICIL": Level.DIFICIL,
    "PERITO": Level.PERITO,
  }[key]!;
}

// extension LevelStringExt on String {
//   Level get levelParse => {
//         "FACIL": Level.FACIL,
//         "MEDIO": Level.MEDIO,
//         "DIFICIL": Level.DIFICIL,
//         "PERITO": Level.PERITO,
//       }[this]!;
// }
// .toString().levelParse

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String image;
  final Level level;

  QuizModel(
      {required this.title,
      required this.questions,
      this.questionAnswered = 0,
      required this.image,
      required this.level})
      : assert(questions.length > 0);

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'image': image,
      'level': level.toString(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      image: map['image'],
      level: parseLevel(map['level']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}

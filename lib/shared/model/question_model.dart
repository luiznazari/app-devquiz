import 'dart:convert';

import 'package:dev_quiz/shared/model/answer_model.dart';

class QuestionModel {
  final String title;
  final List<AnswerModel> answers;
  final String explanation;

  QuestionModel({
    required this.title,
    required this.answers,
    required this.explanation,
  }) : assert(
          answers.length == 4,
        );

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'answers': answers.map((x) => x.toMap()).toList(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'],
      answers: List<AnswerModel>.from(
          map['answers']?.map((x) => AnswerModel.fromMap(x))),
      explanation: map['explanation']!,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source));
}

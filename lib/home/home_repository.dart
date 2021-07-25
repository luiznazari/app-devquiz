import 'dart:convert';

import 'package:dev_quiz/shared/model/quiz_model.dart';
import 'package:dev_quiz/shared/model/user_model.dart';
import 'package:flutter/services.dart';

class HomeRepository {
  Future<UserModel> getUser() async {
    final response =
        await rootBundle.loadString('assets/database/user.json');
    return UserModel.fromJson(response);
  }

  Future<List<QuizModel>> getQuizzes() async {
    final response =
        await rootBundle.loadString('assets/database/quizzes.json');
    final list = jsonDecode(response) as List;
    return list.map((e) => QuizModel.fromMap(e)).toList();
  }
}

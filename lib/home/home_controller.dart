import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/model/awnser_model.dart';
import 'package:DevQuiz/shared/model/question_model.dart';
import 'package:DevQuiz/shared/model/quiz_model.dart';
import 'package:DevQuiz/shared/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class Homecontroller {
  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.EMPTY);
  set state(HomeState homeState) => stateNotifier.value = homeState;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.LOADING;
    await Future.delayed(Duration(seconds: 1));

    user = UserModel(
      name: "ET Bilu",
      photoUrl: "https://avatars.githubusercontent.com/u/7645409?v=4",
    );

    state = HomeState.SUCCESS;
  }

  void getQuizzes() async {
    state = HomeState.LOADING;

    await Future.delayed(Duration(seconds: 1));
    quizzes = [
      QuizModel(
        title: "Quiz Model 1",
        image: AppImages.blocks,
        level: Level.FACIL,
        questions: [
          QuestionModel(
            title: "q1",
            awnsers: [
              AwnserModel(title: "a1"),
              AwnserModel(title: "a2", isRight: true),
              AwnserModel(title: "a3"),
              AwnserModel(title: "a4")
            ],
          )
        ],
      )
    ];

    state = HomeState.SUCCESS;
  }
}

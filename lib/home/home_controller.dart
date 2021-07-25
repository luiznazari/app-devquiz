import 'package:dev_quiz/home/home_repository.dart';
import 'package:dev_quiz/home/home_state.dart';
import 'package:dev_quiz/shared/model/quiz_model.dart';
import 'package:dev_quiz/shared/model/user_model.dart';
import 'package:flutter/cupertino.dart';

class Homecontroller {
  final ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.EMPTY);
  set state(HomeState homeState) => stateNotifier.value = homeState;
  HomeState get state => stateNotifier.value;

  final repository = HomeRepository();

  UserModel? user;
  List<QuizModel>? quizzes;

  Future<HomeState> loadData() async {
    state = HomeState.LOADING;
    user = await repository.getUser();
    quizzes = await repository.getQuizzes();
    state = HomeState.SUCCESS;
    return state;
  }
}

import 'package:dev_quiz/challenge/challenge_page.dart';
import 'package:dev_quiz/core/app_colors.dart';
import 'package:dev_quiz/home/home_controller.dart';
import 'package:dev_quiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:dev_quiz/home/widgets/level_button/level_button_widget.dart';
import 'package:dev_quiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Homecontroller();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.loadData(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
            ),
          );
        }
        return Scaffold(
          appBar: AppBarWidget(user: controller.user!),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LevelButtonWidget(label: 'Fácil'),
                    LevelButtonWidget(label: 'Médio'),
                    LevelButtonWidget(label: 'Difícil'),
                    LevelButtonWidget(label: 'Perito')
                  ],
                ),
                SizedBox(height: 24),
                Expanded(
                  child: GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: controller.quizzes!
                          .map((quiz) => QuizCardWidget(
                                title: quiz.title,
                                percentAnswered: quiz.questionAnswered /
                                    quiz.questions.length,
                                completedQuestions:
                                    '${quiz.questionAnswered}/${quiz.questions.length}',
                                onTap: () {
                                  // "Empilha" as telas.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChallengePage(
                                        questions: quiz.questions,
                                        quizTitle: quiz.title,
                                      ),
                                    ),
                                  );
                                },
                              ))
                          .toList()),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

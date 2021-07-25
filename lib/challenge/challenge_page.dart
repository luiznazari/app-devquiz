import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/home/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/model/question_model.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final String quizTitle;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.quizTitle,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
  }

  void onAnswer(bool isCorrect) {
    controller.pageAnswered = true;
    if (isCorrect) {
      controller.totalCorrectAnswers++;
    }
    setState(() {});
  }

  void nextPage() {
    pageController.nextPage(
      duration: Duration(milliseconds: 100),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              // Mesmo que BackButton:
              // IconButton(
              //     icon: Icon(Icons.close),
              //     onPressed: () {
              //       Navigator.pop(context);
              //     }),

              // Listener para atualizar este widget apenas quando há alteração no PageView.
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value,
                  totalPages: widget.questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: widget.questions
              .map((question) => QuizWidget(
                    question: question,
                    onAnswer: onAnswer,
                  ))
              .toList()),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
              valueListenable: controller.currentPageNotifier,
              builder: (context, value, _) {
                if (value != widget.questions.length) {
                  if (controller.pageAnswered)
                    return NextButtonWidget.green(
                      label: "Avançar",
                      onTap: () {
                        controller.pageAnswered = false;
                        nextPage();
                      },
                    );
                  else
                    return NextButtonWidget.white(
                      label: "Pular",
                      onTap: () {
                        nextPage();
                      },
                    );
                } else
                  return NextButtonWidget.green(
                    label: "Finalizar",
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultPage(
                            quizTitle: widget.quizTitle,
                            totalQuestions: widget.questions.length,
                            totalCorrectAnswers:
                                controller.totalCorrectAnswers,
                          ),
                        )),
                  );
              }),
        ),
      ),
    );
  }
}

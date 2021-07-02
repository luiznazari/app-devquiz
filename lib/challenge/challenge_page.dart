import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget_widget.dart';
import 'package:DevQuiz/home/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
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
              QuestionIndicatorWidget(),
            ],
          ),
        ),
      ),
      body: QuizWidget(title: "O que o Flutter faz em sua totalidade?"),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NextButtonWidget.white(
                label: "Fácil",
                onTap: () {},
              ),
              SizedBox(width: 7),
              NextButtonWidget.green(
                label: "Confirmar",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

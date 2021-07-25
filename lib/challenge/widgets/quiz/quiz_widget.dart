import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/model/answer_model.dart';
import 'package:DevQuiz/shared/model/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onAnswer;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onAnswer,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int selectedIndex = -1;

  bool get isAnswered => selectedIndex != -1;

  AnswerModel answers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 64),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              this.widget.question.title,
              style: AppTextStyles.heading,
            ),
          ),
          SizedBox(height: 24),
          for (var i = 0; i < widget.question.answers.length; i++)
            AnswerWidget(
              answer: answers(i),
              isSelected: selectedIndex == i,
              disabled: isAnswered,
              onTap: () {
                selectedIndex = i;
                widget.onAnswer.call();
                setState(() {});
              },
            ),
          // ...widget.question.answers
          //     .map((e) => AnswerWidget(
          //           isRight: e.isRight,
          //           title: e.title,
          //         ))
          //     .toList()
          SizedBox(height: 24),
          if (this.selectedIndex != -1) Text(widget.question.explanation)
        ],
      ),
    );
  }
}

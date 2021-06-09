import 'package:DevQuiz/challenge/widgets/awnser/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          AwnserWidget(
              title:
                  "Possibilita a criação de lorem ipsum dolor sit amet aaaaa"),
          AwnserWidget(
              isRight: true,
              isSelected: true,
              title:
                  "Possibilita a criação de lorem ipsum dolor sit amet aaaaa"),
          AwnserWidget(
              isRight: false,
              isSelected: true,
              title:
                  "Possibilita a criação de lorem ipsum dolor sit amet aaaaa"),
          AwnserWidget(
              title:
                  "Possibilita a criação de lorem ipsum dolor sit amet aaaaa"),
        ],
      ),
    );
  }
}

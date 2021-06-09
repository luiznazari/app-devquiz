import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final String completedQuestions;
  final double percentAwnsered;

  const QuizCardWidget({
    Key? key,
    required this.title,
    required this.completedQuestions,
    required this.percentAwnsered,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            border:
                Border.fromBorderSide(BorderSide(color: AppColors.border)),
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(AppImages.blocks),
            ),
            SizedBox(height: 20),
            Text(this.title, style: AppTextStyles.heading15),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(this.completedQuestions,
                      style: AppTextStyles.body11),
                ),
                Expanded(
                  flex: 4,
                  child: ProgressIndicatorWidget(value: percentAwnsered),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

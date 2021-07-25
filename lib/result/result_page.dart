import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/widgets/next_button/next_button_widget.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String quizTitle;
  final int totalQuestions;
  final int totalCorrectAnswers;

  const ResultPage({
    Key? key,
    required this.quizTitle,
    required this.totalQuestions,
    required this.totalCorrectAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.trophy),
              Column(
                children: [
                  Text(
                    'Parabéns!',
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Text.rich(
                      TextSpan(
                        text: 'Você concluiu',
                        style: AppTextStyles.body,
                        children: [
                          TextSpan(
                            text: '\n$quizTitle',
                            style: AppTextStyles.bodyBold,
                          ),
                          TextSpan(
                            text:
                                '\ncom $totalCorrectAnswers de $totalQuestions acertos.',
                            style: AppTextStyles.body,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: NextButtonWidget.purple(
                            label: 'Compartilhar',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: NextButtonWidget.transparente(
                            label: 'Voltar ao início',
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

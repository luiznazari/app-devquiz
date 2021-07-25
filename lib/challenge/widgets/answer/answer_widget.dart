import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/model/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.disabled = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      this.answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      this.answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      this.answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      this.answer.isRight ? AppColors.green : AppColors.red;

  Color get _defaultColorCard =>
      this.disabled ? AppColors.lighterGrey : AppColors.white;

  Color get _defaultBorderCard =>
      this.disabled ? AppColors.lighterGrey : AppColors.border;

  TextStyle get _selectedTextStyleRight => this.answer.isRight
      ? AppTextStyles.bodyDarkGreen
      : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight =>
      this.answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: IgnorePointer(
        ignoring: disabled,
        child: GestureDetector(
          onTap: () {
            onTap(answer.isRight);
          },
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: this.isSelected
                  ? _selectedColorCardRight
                  : _defaultColorCard,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(BorderSide(
                color: this.isSelected
                    ? _selectedBorderCardRight
                    : _defaultBorderCard,
              )),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(answer.title,
                      style: isSelected
                          ? _selectedTextStyleRight
                          : AppTextStyles.body),
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: this.isSelected
                        ? _selectedColorRight
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(BorderSide(
                      color: this.isSelected
                          ? _selectedBorderRight
                          : AppColors.border,
                    )),
                  ),
                  child: this.isSelected
                      ? Icon(
                          _selectedIconRight,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  bool pageAnswered = false;
  int totalCorrectAnswers = 0;

  int get currentPage => currentPageNotifier.value;
  set currentPage(int value) => currentPageNotifier.value = value;
}

import 'package:flutter/material.dart';
import 'package:quiz_app/question_summary/summary_item.dart';

class QuestionSummary extends StatelessWidget {
  QuestionSummary({super.key, required this.summary});

  List<Map<String, Object>> summary = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summary.map((data) {
            return SummaryItem(itemData: data);
          }).toList(),
        )
      ),
    );
  }
}
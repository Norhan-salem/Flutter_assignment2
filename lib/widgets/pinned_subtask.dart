import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/task.dart';

class PinnedSubTask extends StatelessWidget {
  final SubTask subtask;
  const PinnedSubTask({super.key, required this.subtask});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          subtask.isDone ? Icons.check_circle_outline_rounded : Icons.radio_button_unchecked_rounded,
          color: subtask.isDone ? AppColors.doneColor : AppColors.subtextColor,
        ),
        const SizedBox(width: 10),
        Text(
          subtask.name,
          style: TextStyle(
            fontSize: 16,
            color: subtask.isDone ? AppColors.doneColor : AppColors.subtextColor,
          ),
        ),
      ],
    );
  }
}
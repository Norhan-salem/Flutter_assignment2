import 'package:flutter/material.dart';
import 'package:session3/widgets/piemenu_button.dart';
import 'package:session3/widgets/progress_indicator.dart';
import '../constants/colors.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  final Task task;
  const TaskTile({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 6, 5, 6),
      decoration: BoxDecoration(
        color: AppColors.subtextColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                '${task.subtasks.length} tasks',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.subtextColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          TaskProgress(progress: task.progress, size: 35),
          const SizedBox(width: 8),
          PieMenuButton(task: task),
        ],
      ),
    );
  }
}


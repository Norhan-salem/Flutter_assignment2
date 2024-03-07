import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:session3/widgets/pinned_subtask.dart';
import 'package:session3/widgets/progress_indicator.dart';
import '../constants/asset_data.dart';
import '../constants/colors.dart';
import '../models/task.dart';

class PinnedTaskDashboard extends StatelessWidget {
  final Task task;
  const PinnedTaskDashboard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.dashboardColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.title,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    SvgPicture.asset(AssetData.pinSvg, width: 30),
                  ],
                ),
                const Divider(
                  color: AppColors.subtextColor,
                  endIndent: 50,
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        children: task.subtasks
                            .map(
                              (subtask) => Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: PinnedSubTask(subtask: subtask),
                          ),
                        ).toList(),
                      ),
                    ),
                    TaskProgress(
                      progress: task.progress,
                      size: 60,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

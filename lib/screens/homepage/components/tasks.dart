import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants/asset_data.dart';
import '../../../constants/routes.dart';
import '../../../models/task.dart';
import '../../../widgets/custom_button.dart';

class YourTasksSection extends StatelessWidget {
  final List<Task> tasks;
  const YourTasksSection({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'Your Tasks',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const Spacer(),
            CustomButton(
              text: 'Add',
              icon: SvgPicture.asset(AssetData.addTaskSvg),
              onPressed: () => Navigator.pushNamed(context, Routes.createTask),
            )
          ],
        ),
        const SizedBox(height: 10),
        Expanded(child: ListView.separated(
                  itemCount: tasks.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                  final task = tasks[index];
                  return TaskTile(task: task);
                  },
          );
        ),
      ],
    );
  }
}
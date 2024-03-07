import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../controllers/tasks_provider.dart';
import '../models/task.dart';

class PieMenuButton extends StatelessWidget {
  final Task task;
  const PieMenuButton({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, tasksProvider, _) {
        return PieMenu(
          onPressed: () => _showSnackBarMessageOnTap(context),
          actions: [
            PieAction(
              tooltip: const Text('Delete'),
              onSelect: () => tasksProvider.removeTask(task),
              child: const Icon(Icons.delete),
            ),
            PieAction(
              tooltip: const Text('Pin'),
              onSelect: () => tasksProvider.pinTask(task),
              child: const Icon(Icons.push_pin),
            ),
          ],
          child: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        );
      },
    );
  }

  void _showSnackBarMessageOnTap(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        shape: StadiumBorder(),
        backgroundColor: AppColors.dashboardColor,
        content: Row(
          children: [
            Icon(Icons.info, color: AppColors.text, size: 30),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                'Please hold and drag to select an action.',
                style: TextStyle(color: AppColors.text, fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
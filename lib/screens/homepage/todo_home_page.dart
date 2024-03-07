import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:provider/provider.dart';

import '../../constants/asset_data.dart';
import '../../constants/colors.dart';
import '../../controllers/tasks_provider.dart';
import '../../models/task.dart';
import '../../widgets/custom_appbar.dart';
import 'components/greeting.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Task> _tasks = [];

  @override
  void initState() {
    super.initState();
    _tasks.addAll(Task.mockUpTasks);
  }

  @override
  Widget build(BuildContext context) {
    // For the pie menu package to work
    return PieCanvas(
      theme: _pieTheme(),
      child: Consumer<TasksProvider>(
        builder: (context, tasksProvider, _) {
          final Task? pinnedTask = tasksProvider.tasks.cast<Task?>().firstWhere(
                (task) => task!.isPinned,
            orElse: () => null,
          );

          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: CustomAppBar(trailing: SvgPicture.asset(AssetData.settingsSvg)),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
              child: Column(
                children: [
                  const GreetingComp(),
                  const SizedBox(height: 32),
                  if (pinnedTask != null) PinnedTask(task: pinnedTask),
                  const SizedBox(height: 32),
                  Expanded(child: TasksComp(tasks: tasksProvider.tasks)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  PieTheme _pieTheme() => const PieTheme(
    brightness: Brightness.dark,
    pointerColor: Colors.transparent,
    radius: 65,
    rightClickShowsMenu: true,
    buttonTheme: PieButtonTheme(backgroundColor: AppColors.secondaryColor, iconColor: AppColors.text),
    buttonThemeHovered: PieButtonTheme(backgroundColor: AppColors.subtextColor, iconColor: AppColors.text),
  );
}


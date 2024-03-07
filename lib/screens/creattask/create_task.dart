import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session3/constants/asset_data.dart';
import 'package:session3/constants/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../controllers/tasks_provider.dart';
import '../../models/task.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_button.dart';
import 'components/titlecomp.dart';
import 'components/todocomp.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final List<TextEditingController> _controllers = [TextEditingController()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: 'Create Task'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Titlecomp(controller: _titleController),
                const SizedBox(height: 15),
                const Divider(color: AppColors.subtextColor),
                const SizedBox(height: 15),
                Todoscomp(
                  controllers: _controllers,
                  onRemove: (int index) {
                    setState(() {
                      _controllers.removeAt(index);
                    });
                  },
                ),
                const SizedBox(height: 10),
                CustomButton(
                  text: 'Add',
                  icon: SvgPicture.asset(AssetData.plusSvg),
                  minimumSize: const Size(200, 45),
                  onPressed: () {
                    setState(() {
                      _controllers.add(TextEditingController());
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: AppColors.secondaryColor,
          shape: const CircleBorder(),
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            context.read<TasksProvider>().addTask(_createTask());
            Navigator.pop(context);
          },
          child: const Icon(Icons.check, color: AppColors.text, size: 40),
        ),
      ),
    );
  }

  Task _createTask() {
    final List<SubTask> todos = [
      for (final controller in _controllers)
        SubTask(
          name: controller.text,
          isDone: false,
        ),
    ];

    return Task(
      title: _titleController.text,
      subtasks: todos,
    );
  }
}

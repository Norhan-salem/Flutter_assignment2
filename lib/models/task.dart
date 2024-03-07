
class SubTask {
  final String name;
  final bool isDone;

  SubTask({
    required this.name,
    required this.isDone,
  });
}


class Task {

  final String title;
  final List<SubTask> subtasks;
  late final double progress;
  bool isPinned;

  Task({
    required this.title,
    required this.subtasks,
    this.isPinned = false,
  }) {
    final doneSubTasks = subtasks.where((subtask) => subtask.isDone).length;
    progress = doneSubTasks / subtasks.length;
  }

  static List<Task> get mockUpTasks {
    return [
      Task(
        title: 'Finish assignment',
        isPinned: true,
        subtasks: [
          SubTask(name: 'assets', isDone: true),
          SubTask(name: 'provider', isDone: true),
          SubTask(name: 'screens', isDone: false),
          SubTask(name: 'widgets', isDone: false),
        ],
      ),
      Task(
        title: 'Prepare for interview',
        subtasks: [
          SubTask(name: 'data structures', isDone: true),
          SubTask(name: 'leetcode', isDone: false),
          SubTask(name: 'behavioural questions', isDone: false),
          SubTask(name: 'algorithms', isDone: true),
        ],
      ),

    ];
  }
}


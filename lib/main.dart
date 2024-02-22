import 'package:flutter/material.dart';
import 'package:session3/screens/create_task.dart';
import 'package:session3/screens/todo_home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        theme: ThemeData.dark(),
        home: CreateTaskPage(),
       routes: {'/TodoHomePage': (context) => TodoHomePage(title: '', todos: []),},
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:session3/util/validators.dart';
import 'package:session3/widgets/input_field.dart';

class TodoHomePage extends StatelessWidget {
  final String title;
  final List<String> todos;

  TodoHomePage({required this.title, required this.todos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index]),
          );
        },
      ),
    );
  }
}

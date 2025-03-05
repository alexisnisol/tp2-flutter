import 'package:flutter/material.dart';
import 'package:tp2/models/todo.dart';

class DetailScreen extends StatelessWidget {

  const DetailScreen({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(todo.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ID: ${todo.id}'),
            Text('User ID: ${todo.title}'),
            Text('Completed: ${todo.completed}'),
          ],
        ),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tp2/models/task.dart';

class DetailTaskScreen extends StatelessWidget {

  const DetailTaskScreen({super.key, required this.data});

  final Task data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(data.title)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${data.id}'),
              Text('User ID: ${data.title}'),
              Text('Tags: ${data.tags}'),
              Text('Number of hours: ${data.nbhours}'),
              Text('Difficulty: ${data.difficulty}'),
              Text('Description: ${data.description}'),
            ],
          ),
        )
    );
  }
}
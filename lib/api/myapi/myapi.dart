import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tp2/models/todo.dart';

import '../../models/task.dart';
import 'package:http/http.dart' as http;

class MyApi {
  Future<List<Task>> getTasks() async {
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('mydata/tasks.json');
    final Map<String, dynamic> json = jsonDecode(dataString);

    if (json['tasks'] != null) {
      final List<Task> tasks = [];
      json['tasks'].forEach((elem) {
        tasks.add(Task.fromJson(elem));
      });
      return tasks;
    } else {
      return [];
    }
  }

  Future<String> _loadAsset(String path) {
    return rootBundle.loadString(path);
  }

  Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      final List<Todo> todos = [];
      for (var elem in json) {
        todos.add(Todo.fromJson(elem));
      }
      return todos;
    } else {
      return [];
    }
  }
}
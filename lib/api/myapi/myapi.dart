import 'dart:convert';

import 'package:flutter/services.dart';

import '../../models/task.dart';

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
}
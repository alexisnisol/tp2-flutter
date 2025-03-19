import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskViewModel extends ChangeNotifier {
  late List<Task> liste;

  TaskViewModel () {
    liste = [];
  }

  void addTask(Task task) {
    liste.add(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    //var index = liste.indexOf(task);
    var index = liste.indexWhere((element) => element.id == task.id);
    if (index != -1) {
      liste[index] = task;
      notifyListeners();
    }
  }

  void insertTask(Task task) {
   liste.add(task);
    notifyListeners();
  }

  void generateTasks() {
    liste = Task.generateTask(5);
    notifyListeners();
  }
}
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
    var ind1 = liste.indexOf(task);
    var ind2 = liste.indexWhere((element) => element.id == task.id);
    if (ind2 != -1) {
      liste[ind2] = task;
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
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp2/models/task.dart';
import 'package:tp2/viewmodels/taskviewmodel.dart';

import '../addtask2.dart';
import 'detail_task.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  late List<Task> tasks;

  void _onAddTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    tasks = context.watch<TaskViewModel>().liste;
    return Container(
      color: Colors.lightGreen,
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            var task = tasks[index];

            return Card(
                child: ListTile(
                    title: Text(task.title),
                    subtitle: Text(task.tags.join(', ')),
                    //leading: Icon(Icons.work),
                  leading: CircleAvatar(child: Text(task.id.toString())),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => AddTaskV2(task: task)));
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            print('Delete ${task.id}');
                            setState(() {

                              tasks.remove(task);
                            });
                          },
                        ),
                      ],
                    ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailTaskScreen(data: task ?? Task.Null())
                        )
                    );
                  },
                )
            );
          }
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:tp2/models/task.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  List<Task> tasks = Task.generateTask(5);

  void _onAddTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
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
                            print('Edit ${task.id}');
                            var idTask = tasks.length+1;
                            _onAddTask(Task(id: idTask, title: "title", tags: ["tags"], nbhours: 5, difficulty: 4, description: "description"));

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
                )
            );
          }
      ),
    );
  }
}
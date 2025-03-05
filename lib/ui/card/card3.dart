import 'package:flutter/material.dart';
import 'package:tp2/models/todo.dart';
import 'package:tp2/ui/card/detail_todo.dart';

import '../../api/myapi/myapi.dart';

class Screen3 extends StatefulWidget {

  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  MyApi myApi = MyApi();

  late Future<List<Todo>> futureTodos;

  @override
  void initState() {
    super.initState();
    futureTodos = myApi.getTodos();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: futureTodos,
        builder: (context, snapshot) {
          if(snapshot.connectionState != ConnectionState.done && !snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                var theTodo = snapshot.data?[index];
                return Card(
                  elevation: 6,
                  margin: const EdgeInsets.all(10),
                  color: Colors.lightBlue,
                  child: ListTile(
                    title: Text(theTodo?.title??"", textDirection: TextDirection.ltr),
                    subtitle: Text(
                        theTodo?.completed == true ? "Completed" : "Not Completed", textDirection: TextDirection.ltr),
                    leading: CircleAvatar(child: Text(theTodo?.id.toString()??"")),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            print('Edit ${theTodo?.id??-1}');
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            print('Delete ${theTodo?.id??-1}');
                          },
                        ),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailScreen(todo: theTodo ?? Todo(0, "", false))
                          )
                      );
                    },
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
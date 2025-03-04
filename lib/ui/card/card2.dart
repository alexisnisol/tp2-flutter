import 'package:flutter/material.dart';
import 'package:tp2/api/myapi/myapi.dart';

class Screen2 extends StatelessWidget {

  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {

    final myApi = MyApi();

    return FutureBuilder(
      future: myApi.getTasks(),
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
              var task = snapshot.data?[index];
              return Card(
                elevation: 6,
                margin: const EdgeInsets.all(10),
                color: Colors.lightBlue,
                child: ListTile(
                  title: Text(task?.title??"", textDirection: TextDirection.ltr),
                  subtitle: Text(
                      task?.tags.join(', ')??"", textDirection: TextDirection.ltr),
                  leading: CircleAvatar(child: Text(task?.id.toString()??"")),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          print('Edit ${task?.id??-1}');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          print('Delete ${task?.id??-1}');
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      });
  }
}
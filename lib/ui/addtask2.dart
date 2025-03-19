import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:tp2/viewmodels/taskviewmodel.dart';

import '../models/task.dart';

class AddTaskV2 extends StatefulWidget {

  const AddTaskV2({super.key, required this.task});

  final Task task;

  @override
  State<AddTaskV2> createState() => _AddTaskV2State();
}

class _AddTaskV2State extends State<AddTaskV2> {

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.task.id == -1 ? 'Ajouter' : 'Modifier'),
      ),
      body: Center(
        child: FormBuilder(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormBuilderTextField(
                  name: 'Title',
                  initialValue: widget.task.title,
                  decoration: const InputDecoration(labelText: 'Titre:'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                ),
                FormBuilderTextField(
                  name: 'Description',
                  initialValue: widget.task.description,
                  decoration: const InputDecoration(labelText: 'Description:'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                ),
                FormBuilderTextField(
                  name: 'Tags',
                  initialValue: widget.task.tags.join(','),
                  decoration: const InputDecoration(labelText: 'Tags:'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required()]),
                ),
                FormBuilderTextField(
                  name: 'Difficulté',
                  initialValue: widget.task.difficulty.toString(),
                  decoration: const InputDecoration(labelText: 'Difficulté:'),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required(), FormBuilderValidators.integer()]),
                ),
                FormBuilderTextField(
                  name: "Nombre d'heures",
                  initialValue: widget.task.nbhours.toString(),
                  decoration: const InputDecoration(labelText: "Nombre d'heures:"),
                  validator: FormBuilderValidators.compose([FormBuilderValidators.required(), FormBuilderValidators.integer()]),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    backgroundColor: Colors.lightBlue,
                  ),
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        if (widget.task.id == -1) {
                          context.read<TaskViewModel>().insertTask(
                              Task.createTask(
                                  _formKey.currentState!.fields['Title']!.value,
                                  _formKey.currentState!.fields['Tags']!.value.split(','),
                                  int.parse(_formKey.currentState!.fields["Nombre d'heures"]!.value),
                                  int.parse(_formKey.currentState!.fields['Difficulté']!.value),
                                  _formKey.currentState!.fields['Description']!.value
                              ));
                        } else {
                          context.read<TaskViewModel>().updateTask(
                              Task.createTaskWithId(
                                  widget.task.id,
                                  _formKey.currentState!.fields['Title']!.value,
                                  _formKey.currentState!.fields['Tags']!.value.split(','),
                                  int.parse(_formKey.currentState!.fields["Nombre d'heures"]!.value),
                                  int.parse(_formKey.currentState!.fields['Difficulté']!.value),
                                  _formKey.currentState!.fields['Description']!.value
                              ));
                        }

                        Navigator.pop(context);
                      }
                    },
                    child: Text(widget.task.id == -1 ? 'Ajouter' : 'Modifier'))
              ],
            )),
      ),
    );
  }
}
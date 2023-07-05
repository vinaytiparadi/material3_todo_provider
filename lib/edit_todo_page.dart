import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/provider/todo_provider.dart';
import 'package:todo_provider/widgets/todo_form_widget.dart';

import 'model/todo.dart';

class EditTodoPage extends StatefulWidget {
  final Todo todo;
  const EditTodoPage({super.key, required this.todo});

  @override
  State<EditTodoPage> createState() => _EditTodoPageState();
}

class _EditTodoPageState extends State<EditTodoPage> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  @override
  void initState() {
    super.initState();

    title = widget.todo.title;
    description = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Edit Task'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            final provider = Provider.of<ToDosProvider>(context, listen: false);
            provider.removeTodo(
              widget.todo,
            );
            Navigator.of(context).pop();
          }, icon: const Icon(Icons.delete)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: TodoFormWidget(
            title: title,
            description: description,
            onChangedTitle: (title) => setState(() => this.title = title),
            onChangedDescription: (description) =>
                setState(() => this.description = description),
            onSavedTodo: () {
              final isValidated = formKey.currentState!.validate();
              if (!isValidated) {
                return;
              } else {
                final provider =
                    Provider.of<ToDosProvider>(context, listen: false);
                provider.updateTodo(
                  widget.todo,
                  title,
                  description,
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/widgets/todo_form_widget.dart';

import '../model/todo.dart';
import '../provider/todo_provider.dart';

class AddToDoDialogWidget extends StatefulWidget {
  const AddToDoDialogWidget({super.key});

  @override
  State<AddToDoDialogWidget> createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Add Task!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22.0,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height* 0.02),
            TodoFormWidget(
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDescription: (description) =>
                  setState(() => this.description = description),
              onSavedTodo: addTodo,
            )
          ],
        ),
      ),
    );
  }

  void addTodo(){
    final isValidated = _formKey.currentState!.validate();
    if(!isValidated){
      return;
  }else{
      final todo = Todo(
        title: title,
        description: description,
        createdTime: DateTime.now(),
      );
      final provider = Provider.of<ToDosProvider>(context, listen: false);
      provider.addTodo(todo);
      Navigator.of(context).pop();
    }
  }
}

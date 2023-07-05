import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/widgets/todo_widget.dart';

import '../provider/todo_provider.dart';

class TodoListWidget extends StatelessWidget {
  const TodoListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ToDosProvider>(context);
    final todos = provider.todos;
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return todos.isEmpty
              ? const Center(
                  child: Text(
                    'No ToDos!',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22.0,
                    ),
                  ),
                )
              : Column(children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TodoWidget(todo: todos[index])),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                ]);
        });
  }
}

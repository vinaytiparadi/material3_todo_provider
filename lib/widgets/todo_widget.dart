import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_provider/model/todo.dart';

import '../provider/todo_provider.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Slidable(
          startActionPane: ActionPane(motion: const DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) {},
              label: 'Edit',
              backgroundColor: Colors.green,
              icon: Icons.edit,
            ),
          ]),
          endActionPane: ActionPane(motion: const DrawerMotion(), children: [
            SlidableAction(
              onPressed: (context) => deleteTodo(context,todo),
              label: 'Delete',
              backgroundColor: Colors.red,
              icon: Icons.delete,
            ),
          ]),
          key: Key(todo.id),
          child: buildTodo(context)),
    );
  }

  Widget buildTodo(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade50,
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(value: todo.isDone, onChanged: (_) {
              final provider = Provider.of<ToDosProvider>(context, listen: false);
              final isDone = provider.toggleTodoStatus(todo);
              Utils.showSnackBar(context, isDone ? 'Task completed!' : 'Task marked incomplete!');
            }),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.03,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todo.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 22.0,
                  ),
                ),
                if (todo.description.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      todo.description,
                      style: const TextStyle(fontSize: 20.0, height: 1.5),
                    ),
                  ),
              ],
            ))
          ],
        ),
      );

  void deleteTodo(BuildContext context, Todo todo){
    final provider = Provider.of<ToDosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the task!');
  }
}

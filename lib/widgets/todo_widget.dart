import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_provider/model/todo.dart';

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
              onPressed: (context) {},
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
            Checkbox(value: todo.isDone, onChanged: (_) {}),
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
}

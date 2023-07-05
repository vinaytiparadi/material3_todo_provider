import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_provider/model/todo.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Slidable(
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
        child: buildTodo(context));
  }

  Widget buildTodo(BuildContext context) => Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(value: todo.isDone, onChanged: (_) {}),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
            Expanded(
                child: Column(
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

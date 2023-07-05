import 'package:flutter/foundation.dart';

import '../model/todo.dart';

class ToDosProvider extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'Walk the Dog 🐕', id: '1'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Get repaired these items: 🔌',
        id: '2',
        description: '''- Laptop
- Phone
- Headphones'''),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }
}

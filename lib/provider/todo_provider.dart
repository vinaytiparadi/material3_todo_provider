import 'package:flutter/foundation.dart';

import '../model/todo.dart';

class ToDosProvider extends ChangeNotifier{
  List<Todo> _todos = [
    Todo(createdTime: DateTime.now(), title: 'Walk the Dog 🐕', id:'1'),
    Todo(
        createdTime: DateTime.now(),
        title: 'Get repaired these items: 🔌',
        id: '2',
      description: '''- Laptop
- Phone
- Headphones'''
    ),
  ];

  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo){
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo){
    _todos.remove(todo);
    notifyListeners();
  }
}
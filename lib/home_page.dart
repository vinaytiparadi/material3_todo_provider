import 'package:flutter/material.dart';
import 'package:todo_provider/widgets/add_todo_diaglog.dart';
import 'package:todo_provider/widgets/completed_list_widget.dart';
import 'package:todo_provider/widgets/todo_list_widget.dart';
import 'package:todo_provider/widgets/todo_widget.dart';

import 'model/todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      const TodoListWidget(),
      const CompletedListWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Material ToDo'),
        centerTitle: true,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedIndex: _selectedIndex,
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.view_list),
            icon: Icon(Icons.view_list_outlined),
            label: 'Tasks',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.check_circle),
            icon: Icon(Icons.check_circle_outline),
            label: 'Completed',
          )
        ],
      ),
      body: tabs[_selectedIndex],
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AddToDoDialogWidget();
              },
            );
          },
          icon: const Icon(Icons.add_task),
          label: const Text('Add Task')),
    );
  }
}

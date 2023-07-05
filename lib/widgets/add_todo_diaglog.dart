import 'package:flutter/material.dart';
import 'package:todo_provider/widgets/todo_form_widget.dart';

class AddToDoDialogWidget extends StatefulWidget {
  const AddToDoDialogWidget({super.key});

  @override
  State<AddToDoDialogWidget> createState() => _AddToDoDialogWidgetState();
}

class _AddToDoDialogWidgetState extends State<AddToDoDialogWidget> {
  final formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
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
            onSavedTodo: (){},
          )
        ],
      ),
    );
  }
}

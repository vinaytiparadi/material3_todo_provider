import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String title;
  final String description;
  final ValueChanged<String> onChangedTitle;
  final ValueChanged<String> onChangedDescription;
  final VoidCallback onSavedTodo;
  const TodoFormWidget(
      {super.key,
      this.title = '',
      this.description = '',
      required this.onChangedTitle,
      required this.onChangedDescription,
      required this.onSavedTodo});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildTitle(),
        buildDescription(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        buildButton(context),
      ],
    );
  }

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Title',
        ),
      );
  Widget buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        onChanged: onChangedDescription,
        // validator: (title) {
        //   if (title!.isEmpty) {
        //     return 'The description cannot be empty';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(
          border:
              UnderlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          labelText: 'Description',
        ),
      );
  Widget buildButton(BuildContext context) => SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onSavedTodo, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.save_alt_outlined),
          SizedBox(width: MediaQuery.of(context).size.width*0.02),
          const Text('Save')
        ],
      )));
}

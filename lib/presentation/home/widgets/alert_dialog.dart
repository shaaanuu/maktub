import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_event.dart';

Widget alertDialog(
  BuildContext context,
  TextEditingController controller,
  int index,
  String title,
) {
  return AlertDialog(
    title: Text(title),
    content: TextField(
      controller: controller,
      onSubmitted: (value) {
        if (controller.text.isNotEmpty) {
          if (title == 'Add') {
            BlocProvider.of<TodoBloc>(context).add(
              AddTodo(controller.text),
            );
          } else if (title == 'Edit') {
            BlocProvider.of<TodoBloc>(context).add(
              EditTodo(index, controller.text),
            );
          }
          controller.clear();
        }
        Navigator.of(context).pop();
      },
    ),
    actions: [
      TextButton(
        onPressed: () {
          if (controller.text.isNotEmpty) {
            if (title == 'Add') {
              BlocProvider.of<TodoBloc>(context).add(
                AddTodo(controller.text),
              );
            } else if (title == 'Edit') {
              BlocProvider.of<TodoBloc>(context).add(
                EditTodo(index, controller.text),
              );
            }
            Navigator.of(context).pop();
            controller.clear();
          }
        },
        child: Text(title),
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/todo/todo_bloc.dart';
import '../../../bloc/todo/todo_event.dart';

class Fab extends StatelessWidget {
  const Fab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (ctx) {
            final controller = TextEditingController();
            return AlertDialog(
              title: const Text('Add Todo'),
              content: TextField(controller: controller),
              actions: [
                TextButton(
                  onPressed: () {
                    final task = controller.text;
                    if (task.isNotEmpty) {
                      BlocProvider.of<TodoBloc>(context).add(AddTodo(task));
                      Navigator.of(ctx).pop();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

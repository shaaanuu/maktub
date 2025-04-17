import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../bloc/theme/theme_bloc.dart';
import '../../bloc/theme/theme_event.dart';
import '../../bloc/todo/todo_bloc.dart';
import '../../bloc/todo/todo_event.dart';
import '../../bloc/todo/todo_state.dart';
import 'widgets/alert_dialog.dart';
import 'widgets/listitem_decoration.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Maktub'),
        actions: [
          IconButton(
            icon: Theme.of(context).brightness == Brightness.dark
                ? const Icon(Icons.brightness_6)
                : const Icon(Icons.dark_mode_outlined),
            onPressed: () {
              context.read<ThemeBloc>().add(ToggleThemeEvent());
            },
          ),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          return state.todos.isEmpty
              ? Center(
                  child: Text(
                    "Destiny calls—add your first task!",
                    style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    final action = ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          borderRadius: BorderRadius.circular(10),
                          icon: Icons.delete_outline_rounded,
                          backgroundColor: Colors.transparent,
                          onPressed: (context) {
                            BlocProvider.of<TodoBloc>(context).add(
                              RemoveTodo(index),
                            );
                          },
                        ),
                      ],
                    );

                    return Slidable(
                      startActionPane: action,
                      endActionPane: action,
                      child: ListItemDecoration(
                        child: ListTile(
                          leading: Checkbox(
                            value: state.todos[index][0],
                            onChanged: (newValue) {
                              if (newValue != null) {
                                BlocProvider.of<TodoBloc>(context).add(
                                  ToggleTodoStatus(index),
                                );
                              }
                            },
                          ),
                          title: Text(
                            state.todos[index][1],
                            style: TextStyle(
                              decoration: state.todos[index][0]
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          onLongPress: () => showDialog(
                            context: context,
                            builder: (context) =>
                                alertDialog(context, controller, index, 'Edit'),
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          builder: (ctx) => alertDialog(context, controller, 0, 'Add'),
        ),
      ),
    );
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'todo_event.dart';
import 'todo_state.dart';

var box = Hive.box('todoBox');

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(box.values.toList())) {
    on<AddTodo>((event, emit) {
      List.from(state.todos).add([false, event.task]);
      emit(TodoState(List.from(state.todos)));

      box.put(box.length, [false, event.task]);
    });

    on<ToggleTodoStatus>((event, emit) {
      final updatedTodos = List.from(state.todos);
      updatedTodos[event.index][0] = !updatedTodos[event.index][0];
      emit(TodoState(updatedTodos));

      box.put(
        event.index,
        [updatedTodos[event.index][0], updatedTodos[event.index][1]],
      );
    });

    on<RemoveTodo>((event, emit) {
      List.from(state.todos).removeAt(event.index);
      emit(TodoState(List.from(state.todos)));

      box.deleteAt(event.index);
    });

    on<EditTodo>((event, emit) {
      List.from(state.todos)[event.index][1] = event.editedTask;
      emit(TodoState(List.from(state.todos)));

      box.putAt(event.index, [false, event.editedTask]);
    });
  }
}

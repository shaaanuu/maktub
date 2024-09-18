import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'todo_event.dart';
import 'todo_state.dart';

var box = Hive.box('todoBox');

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(box.values.toList())) {
    on<AddTodo>((event, emit) {
      final updatedTodos = List.from(state.todos);
      updatedTodos.add([false, event.task]);
      emit(TodoState(updatedTodos));

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
      final updatedTodos = List.from(state.todos);
      updatedTodos.removeAt(event.index);
      emit(TodoState(updatedTodos));

      box.deleteAt(event.index);
    });
  }
}

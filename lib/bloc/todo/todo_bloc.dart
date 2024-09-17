import 'package:flutter_bloc/flutter_bloc.dart';

import 'todo_event.dart';
import 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc()
      : super(TodoState([
          [true, 'Buy groceries'],
          [false, 'Clean the house'],
          [true, 'Finish project'],
          [true, 'Go for a run'],
          [false, 'Read a book'],
          [true, 'Plan weekend trip'],
          [false, 'Water the plants'],
          [true, 'Attend meeting'],
          [false, 'Pay bills'],
          [true, 'Cook dinner'],
          [false, 'Reply to emails'],
          [true, 'Write journal'],
        ])) {
    on<AddTodo>((event, emit) {
      final updatedTodos = List<List<dynamic>>.from(state.todos);
      updatedTodos.add([false, event.task]);
      emit(TodoState(updatedTodos));
    });

    on<ToggleTodoStatus>((event, emit) {
      final updatedTodos = List<List<dynamic>>.from(state.todos);
      updatedTodos[event.index][0] = !updatedTodos[event.index][0];
      emit(TodoState(updatedTodos));
    });

    on<RemoveTodo>((event, emit) {
      final updatedTodos = List<List<dynamic>>.from(state.todos);
      updatedTodos.removeAt(event.index);
      emit(TodoState(updatedTodos));
    });
  }
}

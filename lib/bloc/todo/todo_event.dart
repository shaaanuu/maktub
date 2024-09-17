abstract class TodoEvent {}

class AddTodo extends TodoEvent {
  final String task;
  AddTodo(this.task);
}

class ToggleTodoStatus extends TodoEvent {
  final int index;
  ToggleTodoStatus(this.index);
}

class RemoveTodo extends TodoEvent {
  final int index;
  RemoveTodo(this.index);
}

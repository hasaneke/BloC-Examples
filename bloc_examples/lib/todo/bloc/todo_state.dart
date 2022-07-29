part of 'todo_bloc.dart';

class TodoState {
  final List<SimpleTodo> todos;
  final TodoEventStatus todoEvent;
  TodoState({
    required this.todos,
    required this.todoEvent,
  });

  TodoState copyWith({
    List<SimpleTodo>? todos,
    TodoEventStatus? todoEvent,
  }) {
    return TodoState(
      todos: todos ?? this.todos,
      todoEvent: todoEvent ?? this.todoEvent,
    );
  }
}

enum TodoEventStatus { none, newTodo, todoDeleted, todoCompleted, editTodo }

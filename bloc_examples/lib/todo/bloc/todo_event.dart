part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final String content;
  AddTodoEvent({
    required this.content,
  });
}

class RemoveTodoEvent extends TodoEvent {
  final String id;
  RemoveTodoEvent({
    required this.id,
  });
}

class CompleteTodoEvent extends TodoEvent {
  final String id;
  CompleteTodoEvent({required this.id});
}

class EditTodoEvent extends TodoEvent {
  final String id;
  final String newContent;
  EditTodoEvent({required this.id, required this.newContent});
}

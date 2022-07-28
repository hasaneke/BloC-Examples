import 'package:bloc/bloc.dart';
import 'package:bloc_examples/examples/todo/data/models/todo.dart';
import 'package:flutter/cupertino.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState(todos: [], todoEvent: TodoEventStatus.none)) {
    on<TodoEvent>((event, emit) {
      if (event is AddTodoEvent) {
        _addTodo(emit, event.content);
      } else if (event is RemoveTodoEvent) {
        _removeTodo(emit, event.id);
      } else if (event is CompleteTodoEvent) {
        _completeTodo(emit, event.id);
      } else if (event is EditTodoEvent) {
        _editTodo(emit, event.id, event.newContent);
      }
    });
  }

  void _addTodo(Emitter emit, String content) {
    final key = UniqueKey().toString();
    print(key);
    emit(state.copyWith(
        todos: [...state.todos, Todo(id: UniqueKey().toString(), content: content, isDone: false)],
        todoEvent: TodoEventStatus.newTodo));
  }

  void _removeTodo(Emitter emit, String id) {
    emit(state.copyWith(
        todos: state.todos.where((element) => element.id != id).toList(), todoEvent: TodoEventStatus.todoDeleted));
  }

  void _completeTodo(Emitter emit, String id) {
    emit(state.copyWith(
        todos: state.todos.map((e) {
          if (e.id == id) {
            return e.copyWith(isDone: true);
          } else {
            print(e.id);
            return e;
          }
        }).toList(),
        todoEvent: TodoEventStatus.todoCompleted));
  }

  void _editTodo(Emitter emit, String id, String newContent) {
    emit(
      state.copyWith(
          todos: state.todos.map((e) {
            if (e.id == id) {
              return e.copyWith(content: newContent);
            } else {
              return e;
            }
          }).toList(),
          todoEvent: TodoEventStatus.editTodo),
    );
  }
}

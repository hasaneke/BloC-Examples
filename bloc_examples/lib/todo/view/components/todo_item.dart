import 'package:bloc_examples/todo/bloc/todo_bloc.dart';
import 'package:bloc_examples/todo/data/models/simple_todo.dart';
import 'package:bloc_examples/todo/view/components/edit_todo_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoItem extends StatelessWidget {
  final SimpleTodo todo;
  const TodoItem({
    required this.todo,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.content),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  context.read<TodoBloc>().add(CompleteTodoEvent(id: todo.id));
                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {
                  context.read<TodoBloc>().add(RemoveTodoEvent(id: todo.id));
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
            IconButton(
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      builder: (_) => EditTodoBottomSheet(
                            id: todo.id,
                            content: todo.content,
                          ));
                },
                icon: const Icon(Icons.edit))
          ],
        ),
      ),
    );
  }
}

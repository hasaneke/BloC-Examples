import 'package:bloc_examples/examples/todo/bloc/todo_bloc.dart';
import 'package:bloc_examples/examples/todo/components/add_todo_button.dart';
import 'package:bloc_examples/examples/todo/components/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo Example'),
        ),
        floatingActionButton: const AddTodoFloatingButton(),
        body: const _TodoBody(),
      ),
    );
  }
}

class _TodoBody extends StatelessWidget {
  const _TodoBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        final completedTodos = state.todos.where((todo) => todo.isDone == true).toList();
        final unCompletedTodos = state.todos.where((todo) => todo.isDone == false).toList();
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: unCompletedTodos.length,
                  itemBuilder: (context, i) => TodoItem(
                        todo: state.todos[i],
                      )),
            ),
            Text(completedTodos.isEmpty ? '' : 'Completed Todos'),
            Expanded(
                child: ListView.builder(
                    itemCount: completedTodos.length, itemBuilder: (context, i) => TodoItem(todo: completedTodos[i])))
          ],
        );
      },
    );
  }
}

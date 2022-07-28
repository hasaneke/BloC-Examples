import 'package:bloc_examples/examples/todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoFloatingButton extends StatefulWidget {
  const AddTodoFloatingButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTodoFloatingButton> createState() => _AddTodoFloatingButtonState();
}

class _AddTodoFloatingButtonState extends State<AddTodoFloatingButton> {
  final titleController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (_) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(hintText: 'What to do?'),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<TodoBloc>().add(AddTodoEvent(content: titleController.text));
                        },
                        child: const Text('Add'))
                  ],
                ));
      },
      child: const Icon(Icons.add),
    );
  }
}

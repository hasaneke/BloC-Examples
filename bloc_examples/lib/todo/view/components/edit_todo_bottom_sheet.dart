import 'package:bloc_examples/todo/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditTodoBottomSheet extends StatefulWidget {
  final String id;
  final String content;
  const EditTodoBottomSheet({
    required this.id,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  State<EditTodoBottomSheet> createState() => _EditTodoBottomSheetState();
}

class _EditTodoBottomSheetState extends State<EditTodoBottomSheet> {
  late TextEditingController textEditingController;
  @override
  void initState() {
    textEditingController = TextEditingController(text: widget.content);
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: textEditingController,
        ),
        ElevatedButton(
            onPressed: () {
              context.read<TodoBloc>().add(EditTodoEvent(id: widget.id, newContent: textEditingController.text));
              Navigator.of(context).pop();
            },
            child: const Text('Edit'))
      ],
    );
  }
}

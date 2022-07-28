import 'package:bloc_examples/examples/todo/view/todo_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: const AppBarTheme(
        centerTitle: true,
      )),
      home: const TodoView(),
    ));

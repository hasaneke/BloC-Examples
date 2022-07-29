import 'package:bloc_examples/todo_online/features/login/view/login_page.dart';
import 'package:bloc_examples/todo_online/network/todo_online_network.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const _MyApp());

class _MyApp extends StatelessWidget {
  const _MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<Dio>(create: (context) => TodoNetworkManager().network),
        ],
        child: MaterialApp(
          theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              centerTitle: true,
            ),
          ),
          home: const LoginPage(),
        ));
  }
}

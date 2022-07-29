import 'package:bloc_examples/todo_online/features/login/bloc/login_bloc.dart';
import 'package:bloc_examples/todo_online/features/login/data/service/login_service.dart';
import 'package:bloc_examples/todo_online/features/login/view/login_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(LoginService(context.read<Dio>())),
      child: const LoginView(),
    );
  }
}

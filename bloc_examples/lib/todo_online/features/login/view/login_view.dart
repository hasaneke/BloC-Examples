import 'package:bloc_examples/counter/mixins/show_message_mixin.dart';
import 'package:bloc_examples/todo_online/features/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with ShowMessage {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.loginStatus == LoginStatus.loginFailed) {
          showMessage('Login Failed', context);
        } else if (state.loginStatus == LoginStatus.loginSuccess) {
          showMessage('Login Success', context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login'),
            TextField(
              controller: userNameController,
              decoration: const InputDecoration(hintText: 'username', border: OutlineInputBorder()),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'password', border: OutlineInputBorder()),
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ElevatedButton(
                      onPressed: () async {
                        context.read<LoginBloc>().add(
                            RequestLoginEvent(userName: userNameController.text, password: passwordController.text));
                      },
                      child: const Text('Login'));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

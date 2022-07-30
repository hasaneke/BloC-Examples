import 'package:bloc_examples/todo_online/features/home/bloc/home_bloc.dart';
import 'package:bloc_examples/todo_online/features/home/data/service/home_service.dart';
import 'package:bloc_examples/todo_online/features/home/view/home_view.dart';
import 'package:bloc_examples/todo_online/product/extension/user_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(HomeService(context.networkManager, context.userContext.currentUser!.id!)),
      child: const HomeView(),
    );
  }
}

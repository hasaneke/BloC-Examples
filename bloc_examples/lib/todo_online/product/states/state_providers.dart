import 'package:bloc_examples/todo_online/product/network/todo_online_network.dart';
import 'package:bloc_examples/todo_online/product/states/user_context.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocRepositoryProviders {
  final providers = [
    RepositoryProvider<Dio>(create: (context) => TodoNetworkManager().network),
    RepositoryProvider<UserContext>(create: (context) => UserContext())
  ];
}

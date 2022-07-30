import 'package:bloc_examples/todo_online/product/states/user_context.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension UserContextExtension on BuildContext {
  UserContext get userContext => read<UserContext>();
  Dio get networkManager => read<Dio>();
}

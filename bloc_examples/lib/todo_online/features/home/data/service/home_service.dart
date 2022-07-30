import 'package:bloc_examples/todo_online/features/home/bloc/home_bloc.dart';
import 'package:bloc_examples/todo_online/features/home/data/models/get_todos_response_model.dart';
import 'package:bloc_examples/todo_online/product/network/api_paths.dart';
import 'package:dio/dio.dart';

abstract class IHomeService {
  final int userId;
  Dio networkManager;
  IHomeService(this.networkManager, this.userId);
  Future<List<TodoModel>> getTodosById() async {
    return [];
  }
}

class HomeService extends IHomeService {
  HomeService(super.networkManager, super.userId);

  @override
  Future<List<TodoModel>> getTodosById() async {
    try {
      final response = await networkManager.get(APIPaths.getTodosByUserIdEndPoint.path + userId.toString());
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        final getTodosResponseModel = GetTodosResponseModel.fromJson(response.data);
        return getTodosResponseModel.todos!;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}

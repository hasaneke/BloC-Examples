import 'package:bloc_examples/todo_online/network/api_paths.dart';
import 'package:dio/dio.dart';

abstract class INetworkManager {
  late Dio network;
}

class TodoNetworkManager extends INetworkManager {
  TodoNetworkManager() {
    network = Dio(BaseOptions(baseUrl: APIPaths.baseUrl.path));
  }
}

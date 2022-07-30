import 'package:bloc_examples/todo_online/features/login/data/models/login_request_model.dart';
import 'package:bloc_examples/todo_online/features/login/data/models/user_model.dart';
import 'package:bloc_examples/todo_online/product/network/api_paths.dart';
import 'package:dio/dio.dart';

abstract class ILoginService {
  Dio networkManager;
  ILoginService(this.networkManager);
  Future<User?> login(LoginRequestModel loginRequestModel) async {
    return null;
  }
}

class LoginService extends ILoginService {
  LoginService(super.networkManager);
  @override
  Future<User?> login(LoginRequestModel loginRequestModel) async {
    try {
      final response = await networkManager.post(APIPaths.loginEndPoint.path, data: loginRequestModel.toJson());
      if (response.statusCode! >= 200 && response.statusCode! < 400) {
        final user = User.fromJson(response.data);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

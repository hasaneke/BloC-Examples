import 'package:bloc_examples/todo_online/features/login/data/models/login_request_model.dart';
import 'package:bloc_examples/todo_online/features/login/data/service/login_service.dart';
import 'package:bloc_examples/todo_online/network/api_paths.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ILoginService loginService;

  setUp(() {
    loginService = LoginService(Dio(BaseOptions(baseUrl: APIPaths.baseUrl.path)));
  });

  test('Login test', () async {
    final user = await loginService.login(LoginRequestModel(username: 'kminchelle', password: '0lelplR'));

    print(user);
  });
}

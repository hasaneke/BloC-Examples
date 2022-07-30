import 'package:bloc/bloc.dart';
import 'package:bloc_examples/todo_online/features/login/data/models/login_request_model.dart';
import 'package:bloc_examples/todo_online/features/login/data/models/user_model.dart';
import 'package:bloc_examples/todo_online/features/login/data/service/login_service.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  ILoginService loginService;
  LoginBloc(this.loginService) : super(LoginState(isLoading: false, loginStatus: LoginStatus.none, user: null)) {
    on<LoginEvent>((event, emit) async {
      if (event is RequestLoginEvent) {
        await _login(emit, event);
      }
    });
  }

  Future<void> _login(Emitter emit, RequestLoginEvent event) async {
    emit(state.copyWith(isLoading: true));
    final user = await loginService.login(LoginRequestModel(username: event.userName, password: event.password));
    if (user != null) {
      emit(state.copyWith(isLoading: false, user: user, loginStatus: LoginStatus.loginSuccess));
    } else {
      emit(state.copyWith(isLoading: false, loginStatus: LoginStatus.loginFailed));
    }
  }
}

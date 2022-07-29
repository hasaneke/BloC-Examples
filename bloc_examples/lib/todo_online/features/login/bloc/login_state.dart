part of 'login_bloc.dart';

class LoginState {
  final User? user;
  final bool isLoading;
  final LoginStatus loginStatus;
  LoginState({required this.user, required this.isLoading, required this.loginStatus});

  LoginState copyWith({
    User? user,
    bool? isLoading,
    LoginStatus? loginStatus,
  }) {
    return LoginState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }
}

enum LoginStatus {
  none,
  loginSuccess,
  loginFailed,
}

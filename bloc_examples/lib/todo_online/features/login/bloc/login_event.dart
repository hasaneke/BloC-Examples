part of 'login_bloc.dart';

abstract class LoginEvent {}

class RequestLoginEvent extends LoginEvent {
  final String userName;
  final String password;
  RequestLoginEvent({required this.userName, required this.password});
}

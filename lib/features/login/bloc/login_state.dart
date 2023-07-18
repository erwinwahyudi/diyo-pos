part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginLoggedIn extends LoginState {}

class LoginLoggedOut extends LoginState {}

class LoginError extends LoginState {
  final String message;
  LoginError({
    required this.message,
  });
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginWithPin extends LoginEvent {
  final String pin;
  LoginWithPin({
    required this.pin,
  });
}

class CheckLoginStatus extends LoginEvent {}

class DoLogout extends LoginEvent {}

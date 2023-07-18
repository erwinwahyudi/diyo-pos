// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:diyo_pos/features/login/data/respositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;
  LoginBloc(
    this.authRepository,
  ) : super(LoginInitial()) {
    on<LoginWithPin>((event, emit) async {
      emit(LoginLoading());
      final result = await authRepository.loginWithPIN(event.pin);
      result.fold((error) {
        emit(LoginError(message: error));
      }, (isLogin) {
        debugPrint(result.toString());
        if (isLogin) {
          emit(LoginLoggedIn());
        } else {
          emit(LoginError(message: 'Login Error'));
        }
      });
    });

    on<DoLogout>((event, emit) async {
      await authRepository.removeSessionLogin();
    });
  }
}

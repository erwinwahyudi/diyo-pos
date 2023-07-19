// import 'package:diyo_pos/features/login/bloc/login_bloc.dart';
// import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/login/data/datasources/local_datasources/auth_local_datasource.dart';
import '../features/login/data/respositories/auth_repository.dart';
import '../features/login/presentation/pages/login_page.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

FutureOr<String> authMiddleware(BuildContext context, GoRouterState state) {
  return AuthRepository(authDataSource: AuthDataSource())
      .checkLoginStatus()
      .then((result) {
    if (result.isRight()) {
      final isLoggedIn = result.getOrElse(() => false);
      return isLoggedIn ? state.location : LoginPage.routeName;
    } else {
      // Handle the case where there was an error checking the login status
      return LoginPage.routeName;
    }
  });
}

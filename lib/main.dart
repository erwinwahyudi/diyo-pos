import 'package:diyo_pos/features/home/data/datasources/local_datasources/table_local_datasources.dart';
import 'package:diyo_pos/features/home/data/repositories/table_repository.dart';
import 'package:diyo_pos/features/home/presentation/bloc/detail_table/detail_table_bloc.dart';
import 'package:diyo_pos/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:diyo_pos/features/home/presentation/pages/home_page.dart';
import 'package:diyo_pos/features/login/bloc/login_bloc.dart';
import 'package:diyo_pos/features/login/data/datasources/local_datasources/auth_local_datasource.dart';
import 'package:diyo_pos/features/login/data/respositories/auth_repository.dart';
import 'package:diyo_pos/features/login/presentation/pages/login_page.dart';
import 'package:diyo_pos/routing/router_middleware.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  LoginBloc(AuthRepository(authDataSource: AuthDataSource()))),
          BlocProvider(
              create: (context) => HomeBloc(TableRepository(
                  tableLocalDataSource: TableLocalDataSource()))),
          BlocProvider(
              create: (context) => DetailTableBloc(TableRepository(
                  tableLocalDataSource: TableLocalDataSource())))
        ],
        child: SafeArea(
          child: MaterialApp.router(
            title: 'DIYO POS',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
              useMaterial3: true,
            ),
            routerConfig:
                GoRouter(initialLocation: LoginPage.routeName, routes: [
              GoRoute(
                  path: LoginPage.routeName,
                  builder: (context, state) => const LoginPage()),
              GoRoute(
                path: HomePage.routeName,
                builder: (context, state) => const HomePage(),
                redirect: authMiddleware,
              )
            ]),
          ),
        ));
  }
}

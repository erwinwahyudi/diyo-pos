// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:diyo_pos/features/login/data/datasources/auth_datasource.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final AuthDataSource authDataSource;
  AuthRepository({
    required this.authDataSource,
  });

  Future<Either<String, bool>> checkLoginStatus() async {
    try {
      final isLoggedIn = await authDataSource.isLoggedIn();
      return Right(isLoggedIn);
    } catch (e) {
      return const Left('Failed to login');
    }
  }

  Future<Either<String, bool>> loginWithPIN(String pin) async {
    try {
      if (pin == '1234') {
        await authDataSource.setLoggedIn(true);
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return const Left('Failed to login');
    }
  }

  Future<void> removeSessionLogin() async {
    await authDataSource.setLoggedIn(false);
  }
}

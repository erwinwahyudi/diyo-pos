import 'package:dartz/dartz.dart';
import 'package:diyo_pos/features/order/data/datasources/menu_local_datasource.dart';
import 'package:diyo_pos/features/order/data/models/menu_model.dart';

class MenuRepository {
  final MenuLocalDataSource menuLocalDataSource;
  MenuRepository({
    required this.menuLocalDataSource,
  });
  Future<Either<String, List<Menu>>> getMenu() async {
    try {
      final tableList = await menuLocalDataSource.getMenuList();
      return Right(tableList);
    } catch (e) {
      return const Left('Failed to get menu list');
    }
  }

  Future<Either<String, Menu>> getMenuById(int id) async {
    try {
      final menu = await menuLocalDataSource.getMenuById(id);
      return Right(menu);
    } catch (e) {
      return const Left('Failed to get menu');
    }
  }
}

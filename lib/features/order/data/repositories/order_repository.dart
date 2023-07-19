import 'package:dartz/dartz.dart';
import 'package:diyo_pos/features/order/data/datasources/order_local_datasource.dart';

class OrderRepository {
  final OrderLocalDataSource orderLocalDataSource;

  OrderRepository(this.orderLocalDataSource);

  Future<Either<String, List<Order>>> getOrderList() async {
    try {
      final orderList = await orderLocalDataSource.getOrderList();
      return Right(orderList.cast<Order>());
    } catch (e) {
      return const Left('Failed to get order list');
    }
  }

  Future<Either<String, void>> saveOrderList(List<Order> orderList) async {
    try {
      // await orderLocalDataSource.saveOrderList(orderList.cast<Order>());
      return const Right(null);
    } catch (e) {
      return const Left('Failed to save order list');
    }
  }
}

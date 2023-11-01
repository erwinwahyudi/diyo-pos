// import 'package:diyo_pos/common/failure.dart';
// import 'package:diyo_pos/features/order/data/datasources/order_local_datasource.dart';
// import 'package:dartz/dartz.dart';
// import 'package:diyo_pos/features/order/data/models/order_item_model.dart';
// import 'package:diyo_pos/features/order/data/models/order_table_model.dart';

// import '../../../home/data/models/table_model.dart';

class OrderRepository {
  // final OrderLocalDataSource localDataSource;

  // OrderRepository(this.localDataSource);

  // Future<Either<Failure, List<Order>>> getOrderList() async {
  //   try {
  //     final orderList = await localDataSource.getOrderList();
  //     return Right(orderList as List<Order>);
  //   } catch (e) {
  //     return const Left(Failure('Failed to get order list'));
  //   }
  // }

  // Future<Either<Failure, void>> addMenuToOrder(
  //   int tableId,
  //   OrderItem orderItem,
  // ) async {
  //   try {
  //     final orderList = await getOrderList();
  //     if (orderList.isRight()) {
  //       final List<OrderTable> updatedOrderList = orderList.getOrElse(() => []).cast<OrderTable>();
  //       final existingOrder = updatedOrderList.firstWhere(
  //         (order) => order.table.id == tableId,
  //         orElse: () => OrderTable(table: Table(id: tableId), orderItems: []),
  //       );

  //       if (existingOrder.orderItems.isEmpty) {
  //         existingOrder.orderItems.add(orderItem);
  //         updatedOrderList.add(existingOrder);
  //       } else {
  //         final existingItemIndex = existingOrder.orderItems.indexWhere(
  //           (item) => item.menu.id == orderItem.menu.id,
  //         );

  //         if (existingItemIndex != -1) {
  //           existingOrder.orderItems[existingItemIndex].quantity +=
  //               orderItem.quantity;
  //         } else {
  //           existingOrder.orderItems.add(orderItem);
  //         }
  //       }

  //       await localDataSource.saveOrderList(updatedOrderList);
  //       return const Right(null);
  //     } else {
  //       return Left(orderList.left());
  //     }
  //   } catch (e) {
  //     return const Left(Failure('Failed to add menu to order'));
  //   }
  // }

  // Future<Either<Failure, void>> removeMenuFromOrder(
  //   int tableId,
  //   int menuId,
  // ) async {
  //   try {
  //     final orderList = await getOrderList();
  //     if (orderList.isRight()) {
  //       final List<OrderTable> updatedOrderList = orderList.getOrElse(() => []);
  //       final existingOrderIndex = updatedOrderList.indexWhere(
  //         (order) => order.table.id == tableId,
  //       );

  //       if (existingOrderIndex != -1) {
  //         final existingOrder = updatedOrderList[existingOrderIndex];
  //         existingOrder.orderItems.removeWhere(
  //           (item) => item.menu.id == menuId,
  //         );

  //         if (existingOrder.orderItems.isEmpty) {
  //           updatedOrderList.removeAt(existingOrderIndex);
  //         }

  //         await localDataSource.saveOrderList(updatedOrderList);
  //         return const Right(null);
  //       } else {
  //         return const Left(Failure('Order not found'));
  //       }
  //     } else {
  //       return Left(orderList.left());
  //     }
  //   } catch (e) {
  //     return const Left(Failure('Failed to remove menu from order'));
  //   }
  // }
}

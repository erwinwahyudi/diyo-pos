import 'package:diyo_pos/features/order/data/models/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class OrderLocalDataSource {
  static const String _orderListKey = 'orderList';

  Future<List<Order>> getOrderList() async {
    final prefs = await SharedPreferences.getInstance();
    final orderJsonList = prefs.getStringList(_orderListKey);

    if (orderJsonList == null || orderJsonList.isEmpty) {
      // Jika belum ada data pesanan, kembalikan List<Order> kosong
      return [];
    } else {
      final orderList = orderJsonList
          .map((json) => Order.fromJson(jsonDecode(json)))
          .toList();
      return orderList;
    }
  }

  // function to add Menu and int quantity to OrderItem base on Table


  Future<void> saveOrderList(List<Order> orderList) async {
    final prefs = await SharedPreferences.getInstance();
    final orderJsonList =
        orderList.map((order) => json.encode(order.toJson())).toList();
    await prefs.setStringList(_orderListKey, orderJsonList);
  }
}

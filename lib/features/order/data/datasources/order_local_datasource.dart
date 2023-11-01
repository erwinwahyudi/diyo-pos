class OrderLocalDataSource {
  // static const String _orderedMenuKey = 'orderedMenu';

  // Future<List<Order>> getOrderList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final orderJsonList = prefs.getStringList(_orderedMenuKey);

  //   if (orderJsonList != null) {
  //     return orderJsonList
  //         .map((json) => Order.fromJson(jsonDecode(json)))
  //         .toList();
  //   } else {
  //     return [];
  //   }
  // }

  // Future<void> saveOrderList(List<Order> orderList) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final orderJsonList =
  //       orderList.map((order) => jsonEncode(order.toJson())).toList();
  //   await prefs.setStringList(_orderedMenuKey, orderJsonList);
  // }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'order_item_model.dart';

class OrderTable {
  final int tableId;
  final List<OrderItem> orderItems;

  OrderTable({
    required this.tableId,
    required this.orderItems,
  });

  Map<String, dynamic> toJson() {
    return {
      'table': tableId,
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }

  factory OrderTable.fromJson(Map<String, dynamic> json) {
    return OrderTable(
        tableId: json['table'],
        orderItems: List<OrderItem>.from(json['orderItems'].map(
          (item) => OrderItem.fromJson(item),
        )));
  }
}

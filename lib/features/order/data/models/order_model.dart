import 'order_item_model.dart';
import '../../../home/data/models/table_model.dart';

class Order {
  final Table table;
  final List<OrderItem> orderItems;

  Order({required this.table, required this.orderItems});

  Map<String, dynamic> toJson() {
    return {
      'table': table.toJson(),
      'orderItems': orderItems.map((item) => item.toJson()).toList(),
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      table: Table.fromJson(json['table']),
      orderItems: List<OrderItem>.from(
        json['orderItems'].map((item) => OrderItem.fromJson(item)),
      ),
    );
  }
}

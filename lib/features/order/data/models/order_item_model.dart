import 'package:diyo_pos/features/order/data/models/menu_model.dart';

class OrderItem {
  final Menu menu;
  int quantity;

  OrderItem({required this.menu, this.quantity = 0});

  Map<String, dynamic> toJson() {
    return {
      'menu': menu.toJson(),
      'quantity': quantity,
    };
  }

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      menu: Menu.fromJson(json['menu']),
      quantity: json['quantity'],
    );
  }
}

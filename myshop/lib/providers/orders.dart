import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';

class POrderItem {
  final String id;
  final double amount;
  final List<PCartItem> products;
  final DateTime dateTime;

  POrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<POrderItem> _orders = [];

  List<POrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<PCartItem> cartProducts, double total) {
    _orders.insert(
      0,
      POrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}

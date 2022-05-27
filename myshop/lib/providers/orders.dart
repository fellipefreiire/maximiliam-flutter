import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myshop/providers/cart.dart';
import 'package:http/http.dart' as http;

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

  Future<void> fetchAndSetOrders() async {
    Uri url = Uri.parse(
      'https://myshop-62f91-default-rtdb.firebaseio.com/orders.json',
    );

    final response = await http.get(url);
    final List<POrderItem> loadedOrders = [];

    final extractedData = json.decode(response.body);

    if (extractedData == null) {
      return;
    }

    extractedData.forEach((orderId, orderData) {
      loadedOrders.add(
        POrderItem(
          id: orderId,
          amount: orderData['amount'],
          dateTime: DateTime.parse(orderData['dateTime']),
          products: (orderData['products'] as List<dynamic>)
              .map(
                (item) => PCartItem(
                  id: item['id'],
                  title: item['title'],
                  quantity: item['quantity'],
                  price: item['price'],
                ),
              )
              .toList(),
        ),
      );
    });
    _orders = loadedOrders.reversed.toList();
    notifyListeners();
  }

  Future<void> addOrder(List<PCartItem> cartProducts, double total) async {
    Uri url = Uri.parse(
      'https://myshop-62f91-default-rtdb.firebaseio.com/orders.json',
    );
    final timestamp = DateTime.now();

    final response = await http.post(
      url,
      body: json.encode({
        'amount': total,
        'dateTime': timestamp.toIso8601String(),
        'products': cartProducts
            .map((cp) => {
                  'id': cp.id,
                  'title': cp.title,
                  'quantity': cp.quantity,
                  'price': cp.price,
                })
            .toList(),
      }),
    );

    _orders.insert(
      0,
      POrderItem(
        id: json.decode(response.body)['name'],
        amount: total,
        products: cartProducts,
        dateTime: timestamp,
      ),
    );
    notifyListeners();
  }
}

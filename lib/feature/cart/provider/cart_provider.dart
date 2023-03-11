import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../home/model/product/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> products = [];

  void addProduct(ProductModel p) {
    products.add(p);
    notifyListeners();
  }

  removeProduct(ProductModel p) {
    products.remove(p);
    notifyListeners();
  }

  removeItemProduct(ProductModel p) {
    products.removeWhere((element) => element == p);
    notifyListeners();
  }

  Map productQuantity(List<ProductModel> products) {
    var map = {};
    for (var product in products) {
      if (!map.containsKey(product)) {
        map[product] = 1;
      } else {
        map[product] += 1;
      }
    }

    return map;
  }

  double subTotal(List<ProductModel> products) {
    double total = products.fold(0, (total, first) => total + first.price!);
    return total;
  }

  double deliveryFee(double subTotal) {
    if (subTotal >= 100) {
      return 0.0;
    } else {
      return 15.0;
    }
  }

  String deliveryFeeContent(double subTotal) {
    if (subTotal >= 100) {
      return 'Free Delivery fee';
    } else {
      double missing = 100 - subTotal;
      return 'You can add $missing for free Delivery Fee';
    }
  }

  double total(double subtotal, double deliveryFee) {
    return subtotal + deliveryFee;
  }
}

final cartProvider =
    ChangeNotifierProvider<CartProvider>((ref) => CartProvider());

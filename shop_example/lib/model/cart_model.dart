import 'dart:collection';

import 'package:flutter/foundation.dart';

import 'product_model.dart';

/// A [CartModel] keeps track of a list of [ProductModel]s.
///
/// A [CartModel] saves a list of [ProductModel]s and the purchase total amount
/// (sum of all added products).
class CartModel extends ChangeNotifier {
  final List<ProductModel> _products = [];

  UnmodifiableListView<ProductModel> get products =>
      UnmodifiableListView(_products);

  int get productsCount => _products.length;

  num get totalAmount {
    num totalAmount = 0.0;
    _products.forEach((product) => totalAmount += product.value);
    return totalAmount;
  }

  bool isEmpty() {
    return _products.isEmpty;
  }

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    _products.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _products.clear();
    notifyListeners();
  }
}

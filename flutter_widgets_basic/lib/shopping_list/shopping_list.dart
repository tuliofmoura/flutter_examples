import 'package:flutter/material.dart';
import 'package:flutter_widgets_basic/shopping_list/product.dart';
import 'package:flutter_widgets_basic/shopping_list/shopping_list_item.dart';

void main(List<String> args) {
  const List<Product> products = [
    Product(name: 'Eggs'),
    Product(name: 'Flour'),
    Product(name: 'Chocolate'),
  ];
  runApp(const ShoppingListApp(products: products));
}

class ShoppingListApp extends StatefulWidget {
  const ShoppingListApp({Key? key, required this.products}) : super(key: key);

  final List<Product> products;

  @override
  State<ShoppingListApp> createState() => _ShoppingListAppState();
}

class _ShoppingListAppState extends State<ShoppingListApp> {
  final _shoppingCart = <Product>{};

  void _onCartChanged(Product product, bool inCart) {
    setState(() {
      inCart ? _shoppingCart.remove(product) : _shoppingCart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shopping List'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: widget.products.map((product) {
            return ShoppingListItem(
              callback: _onCartChanged,
              product: product,
              inCart: _shoppingCart.contains(product),
            );
          }).toList(),
        ),
      ),
    );
  }
}

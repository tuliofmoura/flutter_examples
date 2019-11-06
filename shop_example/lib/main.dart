import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_example/routes/product_screen.dart';

import 'model/cart_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => CartModel(),
      child: ShopExampleApp(),
    ),
  );
}

class ShopExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}

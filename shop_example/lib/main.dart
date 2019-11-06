import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_example/routes/product_screen.dart';

import 'model/cart_model.dart';

/// The function that is called when main.dart is run.
void main() {
  runApp(
    ChangeNotifierProvider(
      builder: (context) => CartModel(),
      child: UnitConverterApp(),
    ),
  );
}

/// This widget is the root of our application.
///
/// The first screen we see is a list [Categories], each of which
/// has a list of [Unit]s.
class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.black87,
            ),
      ),
      home: ProductScreen(),
    );
  }
}

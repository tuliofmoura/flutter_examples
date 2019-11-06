import 'package:flutter/material.dart';
import 'package:shop_example/model/product_model.dart';
import 'package:shop_example/views/backdrop.dart';
import 'package:shop_example/views/product_tile.dart';

import 'cart_screen.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen();

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: Colors.blueGrey[50],
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 60.0,
        ),
        child: _buildProductsWidgetsList(),
      ),
    );

    final textStyle = TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.w900,
      color: Colors.white,
    );

    return Backdrop(
      frontPanel: CartScreen(),
      backPanel: listView,
      frontTitle: Text(
        'Pagamento',
        style: textStyle,
      ),
      backTitle: Text(
        'Produtos',
        style: textStyle,
      ),
    );
  }

  Widget _buildProductsWidgetsList() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ProductTile(
          product: ProductModel.stockList[index],
        );
      },
      itemCount: ProductModel.stockList.length,
    );
  }
}

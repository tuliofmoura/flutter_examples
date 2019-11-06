import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_example/model/cart_model.dart';
import 'package:shop_example/util/format_util.dart';
import 'package:shop_example/views/product_resume_tile.dart';

const _padding = EdgeInsets.all(16.0);

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final totalAmount = cart.totalAmount;

    final productsList = ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ProductResumeTile(
          product: cart.products.elementAt(index),
        );
      },
      itemCount: cart.productsCount,
    );

    final totalResume = Container(
      height: 80,
      width: double.infinity,
      color: Color(0xFFFE5F55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
          Text(
            FormatUtil.currencyBRLFormat(cart.totalAmount),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );

    final emptyCart = Center(
      child: Text('Seu carrinho está vazio.'),
    );

    final notEmptyCart = Column(
      children: <Widget>[
        Expanded(
          child: productsList,
        ),
        totalResume,
      ],
    );

    return cart.isEmpty() ? emptyCart : notEmptyCart;
  }
}

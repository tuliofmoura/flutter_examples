import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_example/model/cart_model.dart';
import 'package:shop_example/model/product_model.dart';
import 'package:shop_example/util/format_util.dart';

class ProductResumeTile extends StatelessWidget {
  final ProductModel product;

  const ProductResumeTile({
    Key key,
    @required this.product,
  })  : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<CartModel>(context);
    return Material(
      color: Color(0xFFEEF5DB),
      child: Container(
        height: 60.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 16.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ),
              Text(
                product.value == 0
                    ? 'Grátis'
                    : FormatUtil.currencyBRLFormat(product.value),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FlatButton(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onPressed: () => cart.removeProduct(product),
                child: Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:provider/provider.dart';
import 'package:shop_example/model/cart_model.dart';
import 'package:shop_example/model/product_model.dart';
import 'package:shop_example/util/format_util.dart';

const _rowHeight = 100.0;

class ProductTile extends StatelessWidget {
  final ProductModel product;

  const ProductTile({
    Key key,
    @required this.product,
  })  : assert(product != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Material(
      child: Container(
        height: _rowHeight,
        color: cart.products.contains(product)
            ? product.color['splash']
            : Colors.transparent,
        child: InkWell(
          //borderRadius: _borderRadius,
          highlightColor: product.color['splash'],
          splashColor: product.color['splash'],
          onTap: cart.products.contains(product)
              ? () => cart.removeProduct(product)
              : () => cart.addProduct(product),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    product.iconLocation,
                    size: 60.0,
                    color: product.color['iconColor'],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product.name,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product.value == 0
                              ? 'Grátis'
                              : FormatUtil.currencyBRLFormat(product.value),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Row(
                      /*onPressed: cart.products.contains(product)
                        ? () => cart.removeProduct(product)
                        : () => cart.addProduct(product),*/
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            cart.products.contains(product)
                                ? 'REMOVER'
                                : 'ADICIONAR',
                          ),
                        ),
                        Icon(
                          cart.products.contains(product)
                              ? Icons.close
                              : Icons.add_shopping_cart,
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_widgets_basic/shopping_list/change_callback.dart';
import 'package:flutter_widgets_basic/shopping_list/product.dart';

class ShoppingListItem extends StatelessWidget {
  const ShoppingListItem({
    Key? key,
    required this.callback,
    required this.product,
    required this.inCart,
  }) : super(key: key);

  final CartChangeCallback callback;
  final Product product;
  final bool inCart;

  TextStyle? _getStyle() => inCart
      ? null
      : const TextStyle(
          color: Colors.black54,
          decoration: TextDecoration.lineThrough,
        );

  Color _getBackgroundColor(BuildContext context) {
    // The theme depends on the BuildContext because different
    // parts of the tree can have different themes.
    // The BuildContext indicates where the build isÎ
    // taking place and therefore which theme to use.
    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(product.name[0]),
        backgroundColor: _getBackgroundColor(context),
      ),
      title: Text(
        product.name,
        style: _getStyle(),
      ),
      onTap: () => callback(product, inCart),
    );
  }
}

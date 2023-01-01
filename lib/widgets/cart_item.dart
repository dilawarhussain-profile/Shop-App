import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final double price;
  final double quantity;

  CartItem({
    this.id,
    this.productId,
    this.title,
    this.price,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) =>
          Provider.of<Cart>(context, listen: false).removeItem(productId),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 5,
        ),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Text(
                  '\$$price',
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text(
              'Total: \$${(price * quantity)}',
            ),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}

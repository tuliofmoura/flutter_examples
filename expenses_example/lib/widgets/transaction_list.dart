import 'package:expenses_example/models/transaction.dart';
import 'package:flutter/material.dart';

import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    Key? key,
    required this.transactions,
    required this.deleteCallback,
  }) : super(key: key);

  final List<Transaction> transactions;
  final Function deleteCallback;

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                    height: constraints.maxHeight * 0.7,
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  deleteCallback: deleteCallback);
            },
          );
  }
}

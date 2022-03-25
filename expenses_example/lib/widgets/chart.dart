import 'package:expenses_example/models/transaction.dart';
import 'package:expenses_example/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
    required this.recentTransactions,
  }) : super(key: key);

  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get _groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      final double totalSum = recentTransactions
          .where((element) =>
              element.date.day == weekDay.day &&
              element.date.month == weekDay.month &&
              element.date.year == weekDay.year)
          .fold<double>(
              0, (previousValue, element) => previousValue + element.amount);
      return {
        'day': DateFormat.E().format(weekDay)[0],
        'amount': totalSum,
      };
    }).reversed.toList();
  }

  double get _totalSpending => _groupedTransactionValues.fold(
      0, (sum, tx) => sum + (tx['amount'] as double));

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: _groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'] as String,
                spendingAmout: data['amount'] as double,
                spendingPctOfTotal: _totalSpending <= 0.0
                    ? 0.0
                    : (data['amount'] as double) / _totalSpending,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

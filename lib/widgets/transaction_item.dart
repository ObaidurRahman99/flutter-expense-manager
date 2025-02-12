import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(
          transaction.isIncome ? Icons.arrow_upward : Icons.arrow_downward,
          color: transaction.isIncome ? Colors.green : Colors.red,
        ),
        title: Text(transaction.category),
        subtitle: Text("${transaction.description}"),
        trailing: Column(
          children: [

            Text(
              "₹${transaction.amount.toStringAsFixed(2)} ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: transaction.isIncome ? Colors.green : Colors.red,
              ),
            ),
            Text('${DateFormat.yMMMd().format(transaction.date)}'),
          ],
        ),
      ),
    );
  }
}

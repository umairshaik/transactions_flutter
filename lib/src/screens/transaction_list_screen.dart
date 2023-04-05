import 'package:flutter/material.dart';
import 'package:flutter_calender_expence/src/model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionListScreen extends StatelessWidget {
  final List<TransactionModel> tranactions;
  const TransactionListScreen({super.key, required this.tranactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tranactions.map((tx) {
        return buildSingleTransaction(tx);
      }).toList(),
    );
  }

  Widget buildSingleTransaction(TransactionModel transactionModel) {
    return Card(
      child: Row(children: [
        buildTransactionAmount(transactionModel),
        buildTitleAndDate(transactionModel),
      ]),
    );
  }

  Widget buildTransactionAmount(TransactionModel transactionModel) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 2.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Text(
        '\$${transactionModel.amount}',
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.purple),
      ),
    );
  }

  Widget buildTitleAndDate(TransactionModel transactionModel) {
    return Column(
      children: [
        Text(
          transactionModel.title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          DateFormat.yMMMd().format(transactionModel.date),
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}

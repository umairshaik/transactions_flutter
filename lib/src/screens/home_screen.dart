import 'package:flutter/material.dart';
import 'package:flutter_calender_expence/src/model/transaction.dart';

class HomeScreen extends StatelessWidget {
  final List<TransactionModel> tranactions = [
    TransactionModel(
      id: "1",
      amount: 69.0,
      title: "Shoes",
      date: DateTime.now(),
    ),
    TransactionModel(
      id: "2",
      amount: 19.9,
      title: "Groceries",
      date: DateTime.now(),
    )
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [buildChild1(), buildTransactions()],
    );
  }

  Widget buildChild1() {
    return const Card(
      color: Colors.blueGrey,
      elevation: 5.0,
      child: SizedBox(
        width: double.infinity,
        child: Text("Chart!"),
      ),
    );
  }

  Widget buildTransactions() {
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
        transactionModel.amount.toString(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.purple),
      ),
    );
  }

  Widget buildTitleAndDate(TransactionModel transactionModel) {
    return Column(
      children: [
        Text(transactionModel.title),
        Text(transactionModel.date.toString()),
      ],
    );
  }
}

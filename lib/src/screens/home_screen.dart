import 'package:flutter/material.dart';
import 'package:flutter_calender_expence/src/model/transaction.dart';
import 'package:flutter_calender_expence/src/screens/input_tranaction_screen.dart';
import 'package:flutter_calender_expence/src/screens/transaction_list_screen.dart';
import 'package:intl/intl.dart';

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

  String title = '';
  String amount = '';

  void onTitleTextChange(String text) {
    print(text);
    title = text;
  }

  void onAmountTextChange(String text) {
    print(text);
    amount = text;
  }

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildChild1(),
        InputsTranactionScreen(
          onTitleTextChange: onTitleTextChange,
          onAmountTextChange: onAmountTextChange,
        ),
        TransactionListScreen(tranactions: tranactions)
      ],
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
}

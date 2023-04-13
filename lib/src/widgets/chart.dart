import 'package:flutter/material.dart';
import 'package:flutter_calender_expence/src/models/transaction.dart';
import 'package:flutter_calender_expence/src/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

class ChartData extends StatelessWidget {
  final List<Transaction> recentTranactions;

  const ChartData({required this.recentTranactions, super.key});

  List<Map<String, String>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (int i = 0; i < recentTranactions.length; i++) {
        final DateTime loopingDate = recentTranactions[i].date;
        if (loopingDate.day == weekDay.day &&
            loopingDate.month == weekDay.month &&
            loopingDate.year == weekDay.year) {
          totalSum += recentTranactions[i].amount;
        }
      }
      print(DateFormat.E().format(weekDay));
      print(totalSum);
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum.toString()
      };
    });
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0,
        (double sum, Map<String, String> items) {
      return sum + double.parse(items['amount'] ?? '0');
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6.0,
      margin: const EdgeInsets.all(20.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  label: data['day'] ?? '',
                  spendingAmount: data['amount'] ?? '',
                  spendingPCTOfTotal: totalSpending == 0
                      ? 0
                      : double.parse(data['amount'] ?? '0') / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final String spendingAmount;
  final double spendingPCTOfTotal;

  const ChartBar(
      {super.key,
      required this.label,
      required this.spendingAmount,
      required this.spendingPCTOfTotal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child:
                Text("\$${double.parse(spendingAmount).toStringAsFixed(0)}")),
        const SizedBox(height: 4.0),
        SizedBox(height: 60, width: 10, child: buildBar(context)),
        const SizedBox(height: 4.0),
        Text(label),
      ],
    );
  }

  Widget buildBar(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            color: const Color.fromRGBO(220, 220, 220, 0),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        FractionallySizedBox(
          heightFactor: spendingPCTOfTotal,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        )
      ],
    );
  }
}

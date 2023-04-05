import 'package:flutter/material.dart';

class InputsTranactionScreen extends StatelessWidget {
  final Function(String) onTitleTextChange;
  final Function(String) onAmountTextChange;
  const InputsTranactionScreen({
    super.key,
    required this.onTitleTextChange,
    required this.onAmountTextChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
                decoration: const InputDecoration(labelText: 'Title'),
                onChanged: (String value) => onTitleTextChange(value)),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              onChanged: (value) => onAmountTextChange(value),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Add transaction')),
          ],
        ),
      ),
    );
  }
}

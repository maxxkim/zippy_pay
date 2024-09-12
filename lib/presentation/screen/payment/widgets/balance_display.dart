import 'package:flutter/material.dart';

class BalanceDisplay extends StatelessWidget {
  final double amount;

  const BalanceDisplay({
    Key? key,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.indigo[100],
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You have:',
              style: TextStyle(fontSize: 8, color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '$amount \$', // Форматируем сумму с символом доллара
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
          ),
        ],
      ),
    );
  }
}
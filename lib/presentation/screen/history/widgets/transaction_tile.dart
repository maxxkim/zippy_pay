import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? currency;
  final double amount;
  final VoidCallback onTap;
  final VoidCallback? onIconTap;

  const TransactionTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.amount,
    this.onIconTap,
    this.currency,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.only(top:4.0, bottom: 4.0),
        decoration: BoxDecoration(
          color: Colors.indigo[100],
          borderRadius: BorderRadius.zero,
        ),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
          ),
          subtitle: Text(subtitle),
          leading: ElevatedButton(
            onPressed: onIconTap ?? onTap,
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16),
              backgroundColor: Colors.indigo[900],
            ),
            child: const Icon(Icons.payment, color: Colors.white, size: 30),
          ),
          trailing:  Text('${amount.toString()} $currency', style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
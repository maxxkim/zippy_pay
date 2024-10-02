// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zippy/presentation/screen/dashboard/widgets/transaction_information_display.dart';
import 'package:zippy/presentation/widget/custom_text_field.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? startDate;
    DateTime? endDate;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 0,
        ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
                CustomTextField(
                hintText: "Search",
                controller: TextEditingController(),
              ),
              Row(
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
           
                ],
              ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: startDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != startDate) {
                        startDate = pickedDate;
                      }
                    },
                    child: Container(
                      color: Colors.indigo[900],
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(child: Text(startDate == null ? 'August 2024' : '${startDate.toLocal()}'.split(' ')[0], style: const TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: endDate ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != endDate) {
                        endDate = pickedDate;
                      }
                    },
                    child: Container(
                      color: Colors.indigo[900],
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Center(child: Text(endDate == null ? 'Today' : '${endDate.toLocal()}'.split(' ')[0], style: const TextStyle(color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16.0), // Добавьте отступы для лучшего вида
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Выровнять содержимое по левому краю
                      children: [
                        Text('Expense'),
                        Text('\$ 500', style: Theme.of(context).textTheme.titleLarge), // Замените на вычисленные расходы
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16), // Отступ между контейнерами (при желании)
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.tertiaryFixed,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16.0), // Добавьте отступы для лучшего вида
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Выровнять содержимое по левому краю
                      children: [
                        Text('Income'),
                        Text('\$ 1000', style: Theme.of(context).textTheme.titleLarge), // Замените на вычисленные доходы
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const TransactionsInfoDisplay(),
          ],
        ),
      ),
    );
  }
}
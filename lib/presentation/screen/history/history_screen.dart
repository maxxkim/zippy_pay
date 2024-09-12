// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime? startDate;
    DateTime? endDate;
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.indigo[100],
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none
                ),
                style: TextStyle(fontSize: 16),
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

            // Окошки для отображения расходов и доходов
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text('Expense', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[900])),
                    Text('500'), // Замените на вычисленные расходы
                  ],
                ),
                Column(
                  children: [
                    Text('Income', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo[900])),
                    Text('1000'), // Замените на вычисленные доходы
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Прокручиваемый список
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(onTap: () =>  context.go('/dashboard/history/infoHistory'), 
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.indigo[100],
                        borderRadius: BorderRadius.zero,
                      ), 
                      child: ListTile(
                        title: Text('Transaction #${index + 1}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo[900]),),
                        subtitle: const Text('26-8-2024 11:02'),
                        leading:  ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(16), 
                            backgroundColor: Colors.indigo[900],
                          ),
                          child: const Icon(Icons.payment, color: Colors.white, size: 30),
                          ),
                        trailing: const Text('+13.12 ₽', style: TextStyle(fontSize: 20)),
                  )));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
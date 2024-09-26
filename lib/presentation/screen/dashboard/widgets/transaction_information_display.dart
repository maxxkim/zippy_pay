import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class TransactionsInfoDisplay extends StatelessWidget {
  const TransactionsInfoDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    // Получаем текущий месяц
    DateTime now = DateTime.now();
    String currentMonth = DateFormat('MMMM yy').format(now);

    final List<String> months = [
      "January 24",
      "February 24",
      "March 24",
      "April 24",
      "May 24",
      "June 24",
      "July 24",
      "August 24",
      "September 24",
      "October 24",
      "November 24",
      "December 24",
    ];

    int currentIndex = months.indexOf(currentMonth);
    int startIndex = (currentIndex - 2).clamp(0, months.length); // Начинаем с 2 месяцев до текущего
    int endIndex = (startIndex + 5).clamp(0, months.length); // Отображаем 5 месяцев

    return Row(
      children: [
        Expanded(
          child: Container(
            height: 248,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 56.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryFixed,
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(32), bottom: Radius.circular(32)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                          child: Center(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: endIndex - startIndex,
                              itemBuilder: (context, index) {
                                String month = months[startIndex + index];
                                bool isCurrentMonth = month == currentMonth;
                                return Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                                  child: Text(
                                    month,
                                    style: isCurrentMonth
                                        ? Theme.of(context).textTheme.headlineSmall // Выделяем текущий месяц
                                        : Theme.of(context).textTheme.bodyMedium,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total balance", style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/dollar.svg',
                            height: 32.0,
                            width: 32.0,
                          ),
                          const SizedBox(width: 12.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1 800.08',
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Row(
                                children: [
                                  Text("Show", style: Theme.of(context).textTheme.titleSmall),
                                  Text("/Hide", style: Theme.of(context).textTheme.bodySmall),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32.0),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 56.0,
                        decoration: BoxDecoration(  
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                        ),
                        child: Center( // Центрируем текст внутри контейнера
                          child: Text(
                            "View All",
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
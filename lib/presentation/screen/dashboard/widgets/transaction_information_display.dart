import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
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

    return Expanded( // Оборачиваем в Expanded
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiaryContainer,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => context.go('/dashboard/infoDashboard'),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.zero,
                      ),
                      child: ListTile(
                        title: Text(
                          'Transaction #${index + 1}',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        subtitle: Text('12 September 2024 6:30 PM', style: Theme.of(context).textTheme.bodySmall),
                        leading: SvgPicture.asset(
                          'assets/images/icon_transaction_background.svg',
                          height: 48.0,
                          width: 48.0,
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('+1800.08', style: Theme.of(context).textTheme.labelLarge),
                            SizedBox(width: 8.0), // Добавляем немного отступа между текстом и иконкой
                            SvgPicture.asset(
                              'assets/images/icon_receipt.svg', // Замените на путь к вашей иконке чека
                              height: 24.0, // Высота иконки
                              width: 24.0, // Ширина иконки
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                    ),
                    child: Center(
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
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

void _navigateToTopUp(BuildContext context) {
  context.go('/dashboard/topUp');
}

class DasboardDisplay extends StatefulWidget {
  const DasboardDisplay({super.key});

  @override
  _DasboardDisplayState createState() => _DasboardDisplayState();
}

class _DasboardDisplayState extends State<DasboardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Левый контейнер с балансом
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 16, bottom: 16, right:16),
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
                Container(
                  height: 56.0,
                  decoration: BoxDecoration(  
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
                  ),
                  child: Row(children: [
                    const SizedBox(width: 32.0),
                    Text("Top Up", style: Theme.of(context).textTheme.displayMedium),
                    const SizedBox(width: 72.0),
                    Text("Withdraw", style: Theme.of(context).textTheme.displayMedium),
                  ]),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          children: [
            // Правый верхний квадратный контейнер
            Container(
              width: 96.0, // Ширина для квадратного контейнера
              height: 96.0, // Высота для квадратного контейнера
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(32), // Скругление для квадратного контейнера
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/icon_scan.svg',
                    height: 48.0,
                    width: 48.0,
                  ),
                  const SizedBox(height: 4),
                  Text("Scan", style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Правый нижний квадратный контейнер
            Container(
              width: 96.0, // Ширина для квадратного контейнера
              height: 96.0, // Высота для квадратного контейнера
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondaryContainer,
                borderRadius: BorderRadius.circular(32), // Скругление для квадратного контейнера
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/icon_transfer.svg',
                    height: 48.0,
                    width: 48.0,
                  ),
                  const SizedBox(height: 4),
                  Text("Transfer", style: Theme.of(context).textTheme.titleSmall),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
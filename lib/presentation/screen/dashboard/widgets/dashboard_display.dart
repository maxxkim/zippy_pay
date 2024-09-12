import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zippy/presentation/widgets/custom_circular_button.dart';

// Предположим, что этот метод запускает URL (например, для кнопок Top Up, Withdraw и т. д.)
void _launchURL() {
  // Логика для открытия URL
}

void _navigateToTopUp(BuildContext context) {
  context.go('/dashboard/topUp');
}

class DasboardDisplay extends StatefulWidget {
  const DasboardDisplay({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DasboardDisplayState createState() => _DasboardDisplayState();
}

class _DasboardDisplayState extends State<DasboardDisplay> {
  double dollarAmount = 1342.24; // Начальная сумма в долларах
  static const double defaultExchangeRate = 90.0;
  bool isUsingDefaultRate = true;

  double get rubleAmount => dollarAmount * (isUsingDefaultRate ? defaultExchangeRate : fetchCurrentExchangeRate());

  double fetchCurrentExchangeRate() {
    return 90.0; 
  }

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
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${dollarAmount.toStringAsFixed(2)} \$',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${rubleAmount.toStringAsFixed(2)} ₽',
              style: const TextStyle(fontSize: 28, color: Colors.black),
            ),
          ),
          const SizedBox(height: 8.0),
          if (isUsingDefaultRate) 
            const Align(
              alignment:  Alignment.centerLeft,
              child: 
                Text(
                  'Using default rate',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                ),
            ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularButton(
                icon: Icons.add, 
                label: 'Top Up', 
                onPressed: () => _navigateToTopUp(context),
              ),
              const CircularButton(
                isEnabled: false, 
                icon: Icons.transfer_within_a_station, 
                label: 'Withdraw', 
                onPressed: _launchURL,
              ),
              const CircularButton(
                isEnabled: false, 
                icon: Icons.settings, 
                label: 'Settings', 
                onPressed: _launchURL,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/presentation/bloc/dashboard/dashboard_cubit.dart';
import 'package:zippy/presentation/screen/dashboard/widgets/dashboard_display.dart';
import 'package:zippy/presentation/screen/dashboard/widgets/transaction_information_display.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardCubit(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                _showLogoutConfirmation(context);
              },
            ),
          ],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          toolbarHeight: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const DasboardDisplay(),
              const SizedBox(height: 8),
              Row(
                children: [
                  FilledButton(
                    onPressed: () => print("hui"),
                    child: const Text("Period"),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: () => print("hui"),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.secondaryContainer), // Задаем цвет из темы
                    ),
                    child: Text("Deposit", style: Theme.of(context).textTheme.bodyMedium,),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: () => print("hui"),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.secondaryContainer), // Задаем цвет из темы
                    ),
                    child: Text("Withdrawal", style: Theme.of(context).textTheme.bodyMedium,),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const TransactionsInfoDisplay(),
              /*const SizedBox(height: 8),
              RectangularButton(
                label: 'Pay by Email',
                onPressed: () => context.go('/dashboard/payment'),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => context.go('/dashboard/history'),
                  child: Text(
                    'See full history → ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return TransactionTile(
                      title: 'Transaction #${index + 1}',
                      subtitle: '26-8-2024 11:02',
                      onTap: () => context.go('/dashboard/infoDashboard'), 
                      amount: 13.12,
                      currency: '₽', 
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
          content: const Text('Are you sure you want to log out?'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
              onPressed: () {
                context.go('/');
              },
            ),
            TextButton(
              child: Text('Cancel', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
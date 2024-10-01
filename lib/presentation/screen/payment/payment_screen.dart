import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zippy/presentation/screen/payment/widgets/balance_display.dart';
import 'package:zippy/presentation/screen/payment/widgets/provider_display.dart';
import 'package:zippy/presentation/screen/payment/widgets/transaction_form_display.dart';
import 'package:zippy/presentation/widget/custom_circular_button.dart';
import 'package:zippy/presentation/widget/custom_contact_button.dart';
import 'package:zippy/presentation/widget/custom_contact_button_row.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:zippy/presentation/bloc/dashboard/dashboard_cubit.dart';

class PaymentScreen extends StatelessWidget {
   PaymentScreen({super.key});
    final TextEditingController emailController = TextEditingController();
    final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New payment')),
      body:  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const BalanceDisplay(amount: 3500),
            Center(
        child: ContactButtonRow(
          buttons: [
            ContactButton(
              color: Theme.of(context).colorScheme.primary,
              icon: Icons.add,
              subtitle: 'New\nContact',
            ),
            ContactButton(
              color: Theme.of(context).colorScheme.primary,
              icon: Icons.arrow_right_alt,
              subtitle: 'New\nTransaction',
            ),
            ContactButton(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              icon: Icons.person,
              subtitle: 'Enrique\nIglesias',
            ),
            ContactButton(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              icon: Icons.person,
              subtitle: 'Lionel\nMessi',
            ),
            ContactButton(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              icon: Icons.person,
              subtitle: 'Juan\nPeron',
            ),
            ContactButton(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              icon: Icons.person,
              subtitle: 'John\nDoe',
            ),
            ContactButton(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              icon: Icons.person,
              subtitle: 'Ximena\nMerino',
            ),
          ],
        ),
      ),
            const TransactionFormDisplay(),
            const SizedBox(height: 4),
            
          ],
        ),
      ),
    );
  }

  void _sendTransaction(BuildContext context,){
    String email = emailController.text;
    String amount = amountController.text;

      if (email.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
        _showErrorDialog(context, 'Invalid email address');
        return;
      }
      if (amount.isEmpty || double.tryParse(amount) == null || double.parse(amount) <= 0) {
        _showErrorDialog(context, 'Please enter a valid amount greater than zero');
        return;
      }
      context.go('/dashboard/payment/info');
    }

  void _showErrorDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
          content: Text(text),
          actions: <Widget>[
            TextButton(
              child: Text('Ok', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo[900])),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
        );
      },
    );
  }
}

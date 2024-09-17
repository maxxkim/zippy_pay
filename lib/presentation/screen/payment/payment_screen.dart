import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zippy/presentation/screen/payment/widgets/balance_display.dart';
import 'package:zippy/presentation/screen/payment/widgets/provider_display.dart';
import 'package:zippy/presentation/widget/custom_rectangular_button.dart';
import 'package:zippy/presentation/widget/custom_text_field.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const BalanceDisplay(amount: 3500),
            const SizedBox(height: 8),
            const ProviderDisplay(title: 'Juegalo.com', iconData: Icons.web_stories),
            const SizedBox(height: 8),
            CustomTextField(
              controller: emailController,
              labelText: 'Email',
              hintText: 'Enter email',
              keyboardType: TextInputType.emailAddress, 
            ),
            const SizedBox(height: 8),
            CustomTextField(
              controller: amountController,
              labelText: 'Amount',
              hintText: 'Enter amount',
              keyboardType: TextInputType.phone, 
            ),
            const Spacer(),
            RectangularButton(label: 'Pay', onPressed: () => _sendTransaction(context),),
            const SizedBox(height: 8),
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

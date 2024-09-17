import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zippy/presentation/screen/payment/widgets/provider_display.dart';
import 'package:zippy/presentation/widget/custom_rectangular_button.dart';
import 'package:zippy/presentation/widget/custom_text_field.dart';
import 'package:cloud_functions/cloud_functions.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
class TopUpScreen extends StatelessWidget {
  TopUpScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New TopUp')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 8),
            const ProviderDisplay(title: 'Top Up', iconData: Icons.money),
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
              keyboardType: TextInputType.number, // Use number keyboard for amount input
            ),
            const Spacer(),
            RectangularButton(label: 'Pay', onPressed: () => _sendTransaction(context)),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  Future<void> _sendTransaction(BuildContext context) async {
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

    double parsedAmount = double.parse(amount);

    // Call the payIn function
    await _callPayIn(email: email, amount: parsedAmount, context: context);
  }

  Future<void> _callPayIn({
  required String email,
  required double amount,
  required BuildContext context,
}) async {
  try {
    FirebaseFunctions.instance.httpsCallable('payIn');



    context.go('/dashboard/TopUp/info'); 
  } catch (e) {
    _showErrorDialog(context, 'Error calling payIn: $e');
  }
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

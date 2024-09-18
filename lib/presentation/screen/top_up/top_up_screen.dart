import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/presentation/screen/payment/widgets/provider_display.dart';
import 'package:zippy/presentation/widget/custom_rectangular_button.dart';
import 'package:zippy/presentation/widget/custom_text_field.dart';
import 'package:zippy/domain/state/top_up/top_up_state.dart';
import 'package:zippy/presentation/bloc/top_up/top_up_cubit.dart';

class TopUpScreen extends StatelessWidget {
  TopUpScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopUpCubit(context.read()),
      child: BlocConsumer<TopUpCubit, TopUpState>(
        listener: (context, state) {
          if (state.isSuccess) {
            context.go('/dashboard/TopUp/info');
          } else if (state.message.isNotEmpty) {
            _showErrorDialog(context, state.message);
          }
        },
        builder: (context, state) {
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
                    keyboardType: TextInputType.number,
                  ),
                  const Spacer(),
                  RectangularButton(
                    label: 'Pay',
                    onPressed: () => _sendTransaction(context),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
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
    print("OK");
    context.read<TopUpCubit>().getTopUp(
      merchantId: "2020juegalopro-7j7g",
      transactionId: DateTime.now().millisecondsSinceEpoch.toString(),
      country: "CL",
      currency: "CLP",
      payMethod: "skin",
      documentId: "111111111",
      amount: amount,
      email: email,
      name: "User Name", // You might want to add a name field or get it from user profile
      timestamp: DateTime.now().millisecondsSinceEpoch.toString(),
      urlOk: "https://www.yourSite.com/okUser",
      urlError: "https://www.yourSite.com/errorUser",
      objData: "{}", // Add any additional data as needed
    );
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
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        );
      },
    );
  }
}
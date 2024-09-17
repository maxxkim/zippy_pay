import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/presentation/bloc/auth/auth_cubit.dart';
import 'package:zippy/presentation/widget/custom_rectangular_button.dart';
import 'package:zippy/presentation/widget/custom_text_field.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});
  
  final TextEditingController phoneController = TextEditingController(text: "+1 111 111 11 11");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to Zippy!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (context) => AuthCubit(FirebaseAuth.instance),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message ?? 'Error')));
              }
              // Показываем диалоговое окно, если код подтверждения отправлен
              if (state is AuthCodeSent) {
                _showVerificationDialog(context);
              }
            },
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextField(controller: phoneController, labelText: "Phone Number", hintText: "Enter phone number"),
                  const SizedBox(height: 20),
                  if (state is AuthLoading)
                    const CircularProgressIndicator()
                  else
                    RectangularButton(
                      label: "Login",
                      onPressed: () {
                        final phoneNumber = phoneController.text.trim();
                context.go('/dashboard');

                        if (phoneNumber.isNotEmpty) {
                          context.read<AuthCubit>().loginWithPhone(phoneNumber);
                        }
                      },
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _showVerificationDialog(BuildContext context) {
    final TextEditingController codeController = TextEditingController(text: "111111");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Verification Code'),
          content: CustomTextField(
            controller: codeController,
              labelText: '6-Digit Code',
              hintText: 'Enter the 6-digit code sent to your phone',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final verificationCode = codeController.text.trim();
                if (verificationCode.length == 6) {
                context.go('/dashboard');
                  //context.read<AuthCubit>().verifyCode(verificationCode);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a valid 6-digit code.')));
                }
              },
              child: const Text('Submit'),
            ),
          ],
          shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
        );
      },
    );
  }
}
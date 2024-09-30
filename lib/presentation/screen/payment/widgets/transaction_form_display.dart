import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zippy/presentation/widget/custom_text_field.dart';

class TransactionFormDisplay extends StatelessWidget {

  const TransactionFormDisplay({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
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
                const SizedBox(height: 8),
                CustomTextField(controller: emailController, labelText: 'Mobile number or Email'),
                const SizedBox(height: 16),
                CustomTextField(controller: amountController, labelText: 'Amount', icon: SvgPicture.asset('assets/images/icon_coins.svg', width: 8, height: 8,),),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 40.0,
            width: double.infinity, // Устанавливаем ширину равной родительскому контейнеру
            decoration: BoxDecoration(  
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(32)),
            ),
            child: Row( // Используем Row для выравнивания текста и иконки
              mainAxisAlignment: MainAxisAlignment.center, // Центрируем содержимое
              children: [
                Text(
                  "Continue",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
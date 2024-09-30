import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final Widget? icon; // Иконка будет передаваться как параметр
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.icon, 
    this.keyboardType = TextInputType.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Устанавливаем отступы
        labelStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.0),
        ),
        fillColor: Colors.white, // Устанавливаем цвет фона поля ввода на белый
        filled: true, // Включаем заполнение цвета
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 2.0),
        ),
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        prefixIcon: icon, // Используем prefixIcon для размещения иконки внутри поля
      ),
      style: const TextStyle(color: Colors.black, fontSize: 14), // Уменьшение размера шрифта
      keyboardType: keyboardType,
    );
  }
}
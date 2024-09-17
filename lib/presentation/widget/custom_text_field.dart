import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
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
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.indigo[900] ?? Colors.indigo, width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.indigo[900] ?? Colors.indigo, width: 2.0),
        ),
        labelText: labelText,
        hintText: hintText,
        border: const OutlineInputBorder(borderRadius: BorderRadius.zero),
      ),
      style: const TextStyle(color: Colors.black, fontSize: 14), // Уменьшение размера шрифта
      keyboardType: keyboardType,
    );
  }
}
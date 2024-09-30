import 'package:flutter/material.dart';

class ContactButton {
  final Color color; // Цвет кнопки
  final String label; // Текст внутри кнопки
  final IconData? icon; // Иконка внутри кнопки (может быть null)
  final String subtitle; // Подпись под кнопкой

  ContactButton({
    required this.color,
    required this.label,
    this.icon,
    required this.subtitle,
  });
}


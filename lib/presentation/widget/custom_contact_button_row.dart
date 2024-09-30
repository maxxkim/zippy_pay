import 'package:flutter/material.dart';
import 'package:zippy/presentation/widget/custom_contact_button.dart';
class ContactButtonRow extends StatelessWidget {
  final List<ContactButton> buttons;

  const ContactButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Задайте высоту для вашего ряда кнопок
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: buttons.length,
        itemBuilder: (context, index) {
          final button = buttons[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 24, // Радиус круга
                  backgroundColor: button.color,
                  child: button.icon != null
                      ? Icon(button.icon, color: Colors.white) // Отображаем иконку, если она есть
                      : Text(button.label, style: const TextStyle(color: Colors.white)), // Или текст
                ),
                const SizedBox(height: 4), // Отступ между кнопкой и подписью
                Text(
                  button.subtitle,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
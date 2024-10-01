import 'package:flutter/material.dart';
import 'package:zippy/presentation/widget/custom_contact_button.dart';

class ContactButtonRow extends StatelessWidget {
  final List<ContactButton> buttons;

  const ContactButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
        height: 88, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Центрируем элементы с равномерным пространством
          children: buttons.map((button) {
            return SizedBox(
              height: 64, 
              width: 64, 
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16, // Радиус круга
                    backgroundColor: button.color,
                    child: Icon(button.icon, color: Colors.white), // Отображаем иконку, если она есть
                  ),
                  const SizedBox(height: 4), // Отступ между кнопкой и подписью
                  Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      button.subtitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const RectangularButton({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        backgroundColor: Colors.indigo[900],
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
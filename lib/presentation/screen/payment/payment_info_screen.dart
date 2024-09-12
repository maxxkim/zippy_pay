import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:zippy/presentation/bloc/dashboard/dashboard_cubit.dart';

class PaymentInfoScreen extends StatelessWidget {
  const PaymentInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment info')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.indigo[100],
                borderRadius: BorderRadius.zero,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Transaction was successful!',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    '213.24 \$',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.indigo[900]),
                  ),
                  const SizedBox(height: 24),
                  const Align(
                    alignment: Alignment.center, // Измените на Alignment.center
                    child: Row(
                      mainAxisSize: MainAxisSize.min, // Это поможет Row занимать минимально возможное пространство
                      children: [
                        Text(
                          '1356.32\$',
                          style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.lineThrough),
                        ),
                        Text(" → ", style: TextStyle(fontSize: 16, color: Colors.black)),
                        Text(
                          '1342.24\$',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              )
            ),
            const SizedBox(height: 16),
             Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildCircularButton(Icons.email, 'Send receipt'),
                      _buildCircularButton(Icons.info, 'Info'),
                    ],
                  ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                context.go('/dashboard');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), 
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero, 
                ),
                backgroundColor: Colors.indigo[900],
              ),
              child: const Text(
                'Ok', 
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCircularButton(IconData icon, String label) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
          },
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(16), 
            backgroundColor: Colors.indigo[900],
          ),
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 5),
        Text(label, style: const TextStyle(color: Colors.black, fontSize: 16)),
      ],
    );
  }
}
import 'package:flutter/material.dart';

class WelcomeLoginSection extends StatelessWidget {
  const WelcomeLoginSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selamat Datang Kembali!',
          style: TextStyle(
            color: Color(0xFF252A27),
            fontSize: 23,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.75,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Masuk untuk mengakses dan mengelola '
          'inventaris rumahmu.',
          style: TextStyle(
            color: Color(0xFF68726C),
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }
}

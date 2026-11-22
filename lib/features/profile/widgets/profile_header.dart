import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Profil',
          style: TextStyle(
            color: Color(0xFF252A27),
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.7,
          ),
        ),
        SizedBox(height: 6),
        Text(
          'Rumah lebih teratur, bersama keluarga.',
          style: TextStyle(color: Color(0xFF68726C), fontSize: 13),
        ),
      ],
    );
  }
}

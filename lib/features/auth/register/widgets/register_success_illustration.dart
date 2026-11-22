import 'package:flutter/material.dart';

class RegisterSuccessIllustration extends StatelessWidget {
  const RegisterSuccessIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Image.asset(
        'assets/images/login_ilustration.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
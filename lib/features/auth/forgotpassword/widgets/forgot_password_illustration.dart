import 'package:flutter/material.dart';
import 'package:memoryhome/core/constants/app_colors.dart';

class ForgotPasswordIllustration extends StatelessWidget {
  final bool isSuccess;

  const ForgotPasswordIllustration({super.key, this.isSuccess = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 220,
        height: 220,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Ilustrasi utama
            Image.asset(
              'assets/images/forgot_password.png',
              width: 220,
              height: 220,
              fit: BoxFit.contain,
            ),

            // Badge sukses sebagai overlay
            if (isSuccess)
              Positioned(
                right: 12,
                bottom: 28,
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

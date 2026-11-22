import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class OnboardingHeader extends StatelessWidget {
  final VoidCallback onSkip;

  const OnboardingHeader({super.key, required this.onSkip});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Logo aplikasi
        Image.asset(
          'assets/images/logo.png',
          width: 42,
          height: 42,
          fit: BoxFit.contain,
        ),

        const SizedBox(width: 10),

        // Nama aplikasi
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Digital Memory',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Home Inventory',
              style: TextStyle(fontSize: 11, color: AppColors.textSecondary),
            ),
          ],
        ),

        const Spacer(),

        // Tombol Skip
        TextButton(
          onPressed: onSkip,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          ),
          child: const Text(
            'Lewati',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

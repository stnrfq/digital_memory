import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../models/onboarding_model.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel data;

  const OnboardingContent({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Illustration
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Image.asset(data.image, fit: BoxFit.contain),
          ),
        ),

        const SizedBox(height: 28),

        // Title
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.25,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 14),

        // Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              height: 1.7,
              color: AppColors.textSecondary,
            ),
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}

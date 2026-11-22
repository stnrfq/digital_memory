import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class AppBrandHeader extends StatelessWidget {
  const AppBrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/images/logo.png', fit: BoxFit.contain),
        ),

        const SizedBox(width: 16),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Digital Memory',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  letterSpacing: -0.8,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Rumahmu lupa, aplikasimu ingat.',
                style: TextStyle(fontSize: 15, color: AppColors.textSecondary),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

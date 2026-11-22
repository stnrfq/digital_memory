import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/primary_button.dart';

class RegisterBottomAction extends StatelessWidget {
  final Future<void> Function() onRegister;
  final VoidCallback onLogin;
  final bool isAgreed;
  final bool isLoading;

  const RegisterBottomAction({
    super.key,
    required this.onRegister,
    required this.onLogin,
    required this.isAgreed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Tombol Daftar
        PrimaryButton(
          text: 'Daftar',
          onPressed: () async {
            await onRegister();
          },
          isLoading: isLoading,
          borderRadius: 16,
        ),

        const SizedBox(height: 20),

        // Divider
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.border)),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'atau',
                style: TextStyle(fontSize: 13, color: AppColors.textSecondary),
              ),
            ),
            Expanded(child: Divider(color: AppColors.border)),
          ],
        ),

        const SizedBox(height: 20),

        // Login
        Center(
          child: GestureDetector(
            onTap: onLogin,
            child: RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                children: [
                  TextSpan(text: 'Sudah memiliki akun? '),
                  TextSpan(
                    text: 'Masuk',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

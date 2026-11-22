import 'package:flutter/material.dart';
import 'package:memoryhome/core/constants/app_colors.dart';
import 'package:memoryhome/core/widgets/app_brand_header.dart';
import 'package:memoryhome/core/widgets/primary_button.dart';

import '../widgets/forgot_password_illustration.dart';

class ResetEmailSentPage extends StatelessWidget {
  final String email;

  const ResetEmailSentPage({super.key, required this.email});

  void _backToLogin(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  void _resendEmail(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Permintaan kirim ulang berhasil diproses.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              AppBrandHeader(),

              const SizedBox(height: 70),

              // Success Illustration
              const ForgotPasswordIllustration(isSuccess: true),

              const SizedBox(height: 65),

              // Title
              const Text(
                'Periksa Email Kamu',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 12),

              // Description
              Text(
                'Jika email $email terdaftar, kami akan mengirimkan '
                'instruksi untuk mengatur ulang password. Silakan '
                'periksa inbox atau folder spam.',
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.7,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 32),

              // Primary Button: Back to Login
              PrimaryButton(
                text: 'Kembali ke Login',
                onPressed: () => _backToLogin(context),
                borderRadius: 16,
              ),

              const SizedBox(height: 28),

              // Resend Email
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  children: [
                    const Text(
                      'Belum menerima email? ',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _resendEmail(context),
                      child: const Text(
                        'Kirim ulang',
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

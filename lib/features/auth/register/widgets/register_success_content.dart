import 'package:flutter/material.dart';
import 'package:memoryhome/core/widgets/primary_button.dart';

import '../../../../core/constants/app_colors.dart';

class RegisterSuccessContent extends StatelessWidget {
  final String nama;
  final VoidCallback onContinue;

  const RegisterSuccessContent({
    super.key,
    required this.nama,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Akun berhasil dibuat',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
            letterSpacing: -0.7,
          ),
        ),

        const SizedBox(height: 24),

        Text(
          'Halo, $nama! Akunmu siap digunakan. '
          'Sekarang kamu bisa mulai mencatat barang dan lokasi '
          'penyimpanannya di rumah.',
          style: TextStyle(
            fontSize: 17,
            height: 1.6,
            color: AppColors.textSecondary,
          ),
        ),

        const SizedBox(height: 48),

        PrimaryButton(
          text: 'Masuk ke Akun',
          onPressed: onContinue,
          borderRadius: 22,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:memoryhome/core/constants/app_colors.dart';
import 'package:memoryhome/core/widgets/primary_button.dart';

class ForgotPasswordForm extends StatelessWidget {
  final TextEditingController emailController;
  final VoidCallback onSubmit;
  final bool isLoading;

  const ForgotPasswordForm({
    super.key,
    required this.emailController,
    required this.onSubmit,
    this.isLoading = false,
  });

  String? _validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email wajib diisi';
    }

    final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

    if (!emailRegex.hasMatch(value.trim())) {
      return 'Format email tidak valid';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alamat Email',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: 10),

        TextFormField(
          controller: emailController,
          validator: _validateEmail,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) {
            if (!isLoading) onSubmit();
          },
          style: const TextStyle(fontSize: 15, color: AppColors.textPrimary),
          decoration: InputDecoration(
            hintText: 'Masukkan email yang terdaftar',
            hintStyle: const TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
            ),
            prefixIcon: const Icon(
              Icons.mail_outline_rounded,
              color: AppColors.textSecondary,
              size: 22,
            ),
            filled: true,
            fillColor: AppColors.surface,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.border, width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(
                color: AppColors.primary,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.error, width: 1.3),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: const BorderSide(color: AppColors.error, width: 1.5),
            ),
          ),
        ),

        const SizedBox(height: 28),

        // Primary Button
        PrimaryButton(
          text: 'Kirim Link Reset',
          onPressed: onSubmit,
          isLoading: isLoading,
          borderRadius: 16,
        ),
      ],
    );
  }
}

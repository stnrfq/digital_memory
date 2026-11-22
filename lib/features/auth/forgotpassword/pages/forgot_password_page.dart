import 'package:flutter/material.dart';
import 'package:memoryhome/core/constants/app_colors.dart';
import 'package:memoryhome/core/widgets/app_brand_header.dart';
import 'package:memoryhome/features/auth/forgotpassword/pages/reset_email_send_page.dart';

import '../widgets/forgot_password_illustration.dart';
import '../widgets/forgot_password_form.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _submitReset() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResetEmailSentPage(email: _emailController.text.trim()),
      ),
    );
  }

  void _backToLogin() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                AppBrandHeader(),

                const SizedBox(height: 70),

                // Ilustrasi
                const ForgotPasswordIllustration(),

                const SizedBox(height: 65),

                // Title
                const Text(
                  'Lupa Password?',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 12),

                // Description
                const Text(
                  'Jangan khawatir, kami akan membantu kamu '
                  'mengatur ulang password akunmu.',
                  style: TextStyle(
                    fontSize: 15,
                    height: 1.7,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 32),

                // Form email
                ForgotPasswordForm(
                  emailController: _emailController,
                  onSubmit: _submitReset,
                ),

                const SizedBox(height: 28),

                // Back to login
                Center(
                  child: GestureDetector(
                    onTap: _backToLogin,
                    child: const Text(
                      'Kembali ke Login',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

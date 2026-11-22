import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/widgets/app_brand_header.dart';
import '../widgets/register_success_illustration.dart';
import '../widgets/register_success_content.dart';

class RegisterSuccessPage extends StatelessWidget {
  final String nama;
  final VoidCallback onContinue;

  const RegisterSuccessPage({
    super.key,
    required this.nama,
    required this.onContinue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 24, 28, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBrandHeader(),
              const SizedBox(height: 48),

              const RegisterSuccessIllustration(),

              const SizedBox(height: 40),

              RegisterSuccessContent(
                nama: nama,
                onContinue: onContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/widgets/primary_button.dart';

class OnboardingButton extends StatelessWidget {
  final bool isLastPage;
  final VoidCallback onPressed;

  const OnboardingButton({
    super.key,
    required this.isLastPage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      text: isLastPage ? 'Mulai Sekarang' : 'Selanjutnya',
      onPressed: onPressed,
      trailingIcon: isLastPage ? Icons.arrow_forward_rounded : null,
      borderRadius: 16,
    );
  }
}

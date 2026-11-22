import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../auth/login/pages/login_page.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_header.dart';
import '../widgets/onboarding_content.dart';
import '../widgets/onboarding_indicator.dart';
import '../widgets/onboarding_button.dart';
import '../services/onboarding_storage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  // Mengontrol perpindahan slide onboarding
  final PageController _pageController = PageController();

  // Menyimpan index halaman yang sedang aktif
  int currentPage = 0;

  // Memeriksa apakah berada di slide terakhir
  bool get isLastPage => currentPage == onboardingData.length - 1;

  // Menyelesaikan onboarding dan menyimpan status
  Future<void> _finishOnboarding() async {
    await OnboardingStorage.setOnboardingCompleted();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  // Berpindah ke slide berikutnya
  void _nextPage() {
    if (isLastPage) {
      _finishOnboarding();
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  // Memperbarui index saat halaman berubah
  void _onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              // Header
              OnboardingHeader(onSkip: _finishOnboarding),

              const SizedBox(height: 12),

              // Onboarding Slides
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: onboardingData.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return OnboardingContent(data: onboardingData[index]);
                  },
                ),
              ),

              const SizedBox(height: 12),

              // Page Indicator
              OnboardingIndicator(
                currentPage: currentPage,
                totalPages: onboardingData.length,
              ),

              const SizedBox(height: 28),

              // Bottom Button
              OnboardingButton(isLastPage: isLastPage, onPressed: _nextPage),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

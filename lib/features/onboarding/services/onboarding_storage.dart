import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStorage {
  static const String _onboardingKey = 'onboarding_completed';

  // Mengecek apakah onboarding sudah pernah selesai
  static Future<bool> hasCompletedOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
  }

  // Menyimpan status onboarding telah selesai
  static Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }
}
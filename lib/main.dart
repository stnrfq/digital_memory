import 'package:flutter/material.dart';
import 'package:memoryhome/features/navigation/pages/main_navigation_page.dart';
import 'package:memoryhome/providers/auth_providers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'features/onboarding/pages/onboarding_page.dart';
import 'features/onboarding/services/onboarding_storage.dart';
import 'features/auth/login/pages/login_page.dart';
import 'features/home/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cek onboarding
  final onboardingCompleted = await OnboardingStorage.hasCompletedOnboarding();

  // Cek session login
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(
    MyApp(onboardingCompleted: onboardingCompleted, isLoggedIn: isLoggedIn),
  );
}

class MyApp extends StatelessWidget {
  final bool onboardingCompleted;
  final bool isLoggedIn;

  const MyApp({
    super.key,
    required this.onboardingCompleted,
    required this.isLoggedIn,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider()..loadSession(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Memory',
        home: !onboardingCompleted
            ? const OnboardingPage()
            : isLoggedIn
            ? const MainNavigationPage()
            : const LoginPage(),
      ),
    );
  }
}

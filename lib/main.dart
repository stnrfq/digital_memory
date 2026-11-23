import 'package:flutter/material.dart';
import 'package:memoryhome/core/utils/app_messeger.dart';
import 'package:provider/provider.dart';

import 'features/onboarding/pages/onboarding_page.dart';
import 'features/onboarding/services/onboarding_storage.dart';
import 'features/auth/login/pages/login_page.dart';
import 'features/navigation/pages/main_navigation_page.dart';
import 'providers/auth_providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final onboardingCompleted = await OnboardingStorage.hasCompletedOnboarding();

  runApp(MyApp(onboardingCompleted: onboardingCompleted));
}

class MyApp extends StatelessWidget {
  final bool onboardingCompleted;

  const MyApp({super.key, required this.onboardingCompleted});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider()..loadSession(),
      child: MaterialApp(
        scaffoldMessengerKey: appMessengerKey,
        debugShowCheckedModeBanner: false,
        title: 'Digital Memory',
        home: !onboardingCompleted ? const OnboardingPage() : const AuthGate(),
      ),
    );
  }
}

// =====================================
// AUTH GATE
// =====================================
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, auth, child) {
        if (auth.isLoading) {
          return const Scaffold(
            backgroundColor: Color(0xFFF8F9F6),
            body: Center(
              child: CircularProgressIndicator(color: Color(0xFF285C48)),
            ),
          );
        }

        if (auth.isLoggedIn) {
          return const MainNavigationPage();
        }

        return const LoginPage();
      },
    );
  }
}

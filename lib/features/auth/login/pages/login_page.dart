import 'package:flutter/material.dart';
import 'package:memoryhome/features/navigation/pages/main_navigation_page.dart';
import 'package:memoryhome/providers/auth_providers.dart';
import 'package:provider/provider.dart';

import 'package:memoryhome/core/widgets/app_brand_header.dart';
import 'package:memoryhome/features/auth/forgotpassword/pages/forgot_password_page.dart';
import 'package:memoryhome/features/auth/register/pages/register_page.dart';

import '../widgets/welcome_login_section.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username/email dan password harus diisi.'),
        ),
      );
      return;
    }

    try {
      // [Provider] Mengambil AuthProvider tanpa membuat halaman rebuild
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      // [Provider] Proses login dan penyimpanan session
      await authProvider.login(
        identifier: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;

      // Navigasi ke Home setelah login berhasil
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainNavigationPage()),
        (route) => false,
      );
    } catch (e) {
      if (!mounted) return;

      final errorMessage = e.toString().replaceFirst('Exception: ', '');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red.shade700,
        ),
      );
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // [Provider] Mengambil status loading global
    final isLoading = context.watch<AuthProvider>().isLoading;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(28, 28, 28, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AppBrandHeader(),
              const SizedBox(height: 28),
              const WelcomeLoginSection(),
              const SizedBox(height: 28),

              LoginForm(
                emailController: emailController,
                passwordController: passwordController,
                onLogin: login,
                isLoading: isLoading,
                onRegister: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                onForgotPassword: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

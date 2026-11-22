import 'package:flutter/material.dart';
import 'package:memoryhome/core/widgets/primary_button.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;
  final VoidCallback onRegister;
  final VoidCallback onForgotPassword;
  final bool isLoading;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
    required this.onRegister,
    required this.onForgotPassword,
    this.isLoading = false,
  });

  @override
  State<LoginForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<LoginForm> {
  bool isPasswordVisible = false;

  Widget buildTextField({
    required String label,
    required String hint,
    required IconData icon,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF252A27),
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 9),
        SizedBox(
          height: 54,
          child: TextField(
            controller: controller,
            obscureText: isPassword && !isPasswordVisible,
            keyboardType: isPassword
                ? TextInputType.visiblePassword
                : TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Color(0xFF68726C),
                fontSize: 13,
              ),
              prefixIcon: Icon(icon, color: const Color(0xFF68726C), size: 21),
              suffixIcon: isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFF68726C),
                        size: 21,
                      ),
                    )
                  : null,
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE3E8E1)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Color(0xFF285C48),
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextField(
          label: 'Username/Email',
          hint: 'Masukkan username atau email',
          icon: Icons.alternate_email,
          controller: widget.emailController,
        ),

        const SizedBox(height: 20),

        buildTextField(
          label: 'Password',
          hint: 'Masukkan password',
          icon: Icons.lock_outline,
          controller: widget.passwordController,
          isPassword: true,
        ),

        const SizedBox(height: 14),

        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: widget.onForgotPassword,
            child: const Text(
              'Lupa Password?',
              style: TextStyle(
                color: Color(0xFF285C48),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 26),

        // Primary Button
        PrimaryButton(
          text: 'Masuk',
          onPressed: widget.onLogin,
          isLoading: widget.isLoading,
          borderRadius: 12,
        ),

        const SizedBox(height: 26),

        // Register
        Center(
          child: GestureDetector(
            onTap: widget.onRegister,
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: Color(0xFF68726C), fontSize: 13),
                children: [
                  TextSpan(text: 'Belum memiliki akun? '),
                  TextSpan(
                    text: 'Daftar',
                    style: TextStyle(
                      color: Color(0xFF285C48),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

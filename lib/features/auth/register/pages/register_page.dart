import 'package:flutter/material.dart';
import 'package:memoryhome/core/widgets/app_brand_header.dart';
import 'package:memoryhome/features/auth/register/pages/register_success_page.dart';
import 'package:memoryhome/features/auth/services/auth_service.dart';
import 'package:memoryhome/features/navigation/pages/main_navigation_page.dart';
import 'package:memoryhome/providers/auth_providers.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';
import '../widgets/register_form_field.dart';
import '../widgets/register_bottom_action.dart';
import 'terms_page.dart';
import 'privacy_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final AuthService _authService = AuthService();

  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isAgreed = false;

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Nama lengkap wajib diisi';
    }

    if (value.trim().length < 3) {
      return 'Nama lengkap minimal 3 karakter';
    }

    return null;
  }

  String? _validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username wajib diisi';
    }

    if (value.length < 3) {
      return 'Username minimal 3 karakter';
    }

    if (value.contains(' ')) {
      return 'Username tidak boleh mengandung spasi';
    }

    final usernameRegex = RegExp(r'^[a-zA-Z0-9_.]+$');

    if (!usernameRegex.hasMatch(value)) {
      return 'Username hanya boleh berisi huruf, angka, titik, dan underscore';
    }

    return null;
  }

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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password wajib diisi';
    }

    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }

    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Konfirmasi password wajib diisi';
    }

    if (value != _passwordController.text) {
      return 'Password tidak sama';
    }

    return null;
  }

  Future<void> _register() async {
    // Validasi seluruh field
    final isFormValid = _formKey.currentState!.validate();

    if (!isFormValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Silakan lengkapi data pendaftaran terlebih dahulu.'),
        ),
      );
      return;
    }

    // Validasi persetujuan
    if (!_isAgreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Silakan setujui Syarat Penggunaan dan Kebijakan Privasi.',
          ),
        ),
      );
      return;
    }

    // Hindari request ganda
    if (_isLoading) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // Kirim data ke API Register
      final user = await _authService.register(
        namaLengkap: _nameController.text.trim(),
        username: _usernameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      // =========================
      // REGISTRASI BERHASIL
      // TAMPILKAN SUCCESS PAGE
      // =========================

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterSuccessPage(
            nama: user.namaLengkap,
            onContinue: () async {
              try {
                // Login otomatis setelah user menekan tombol di success page
                final authProvider = Provider.of<AuthProvider>(
                  context,
                  listen: false,
                );

                await authProvider.login(
                  identifier: _usernameController.text.trim(),
                  password: _passwordController.text,
                );

                if (!mounted) return;

                // Jika login berhasil, masuk ke Home
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainNavigationPage(),
                  ),
                  (route) => false,
                );
              } catch (e) {
                if (!mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.toString().replaceFirst('Exception: ', '')),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
          ),
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _openTerms() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const TermsPage()),
    );
  }

  void _openPrivacy() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const PrivacyPage()),
    );
  }

  void _openLogin() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBrandHeader(),

                const SizedBox(height: 36),

                const Text(
                  'Buat Akun Baru',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Daftar sekarang dan mulai mengelola semua barang '
                  'di rumahmu dengan lebih mudah.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.6,
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 32),

                RegisterFormField(
                  label: 'Nama Lengkap',
                  hintText: 'Masukkan nama lengkap',
                  prefixIcon: Icons.person_outline_rounded,
                  controller: _nameController,
                  validator: _validateName,
                  keyboardType: TextInputType.name,
                ),

                const SizedBox(height: 22),

                RegisterFormField(
                  label: 'Username',
                  hintText: 'Buat username',
                  prefixIcon: Icons.alternate_email_rounded,
                  controller: _usernameController,
                  validator: _validateUsername,
                ),

                const SizedBox(height: 22),

                RegisterFormField(
                  label: 'Email',
                  hintText: 'Masukkan alamat email',
                  prefixIcon: Icons.mail_outline_rounded,
                  controller: _emailController,
                  validator: _validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 22),

                RegisterFormField(
                  label: 'Password',
                  hintText: 'Buat password minimal 8 karakter',
                  prefixIcon: Icons.lock_outline_rounded,
                  controller: _passwordController,
                  validator: _validatePassword,
                  obscureText: !_isPasswordVisible,
                  helperText: 'Gunakan minimal 8 karakter',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),

                const SizedBox(height: 22),

                RegisterFormField(
                  label: 'Konfirmasi Password',
                  hintText: 'Masukkan ulang password',
                  prefixIcon: Icons.lock_outline_rounded,
                  controller: _confirmPasswordController,
                  validator: _validateConfirmPassword,
                  obscureText: !_isConfirmPasswordVisible,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                      });
                    },
                    icon: Icon(
                      _isConfirmPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),

                const SizedBox(height: 28),

                // Checkbox persetujuan, ikut scroll
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: _isAgreed,
                        onChanged: (value) {
                          setState(() {
                            _isAgreed = value ?? false;
                          });
                        },
                        activeColor: AppColors.primary,
                        checkColor: Colors.white,
                        side: const BorderSide(
                          color: AppColors.border,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Wrap(
                          children: [
                            const Text(
                              'Saya menyetujui ',
                              style: TextStyle(
                                fontSize: 13,
                                height: 1.6,
                                color: AppColors.textSecondary,
                              ),
                            ),

                            GestureDetector(
                              onTap: _openTerms,
                              child: const Text(
                                'Syarat Penggunaan',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            const Text(
                              ' dan ',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),

                            GestureDetector(
                              onTap: _openPrivacy,
                              child: const Text(
                                'Kebijakan Privasi',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            const Text(
                              ' Digital Memory.',
                              style: TextStyle(
                                fontSize: 13,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),

      // Fixed bottom action
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
          child: RegisterBottomAction(
            isAgreed: _isAgreed,
            onRegister: _isLoading ? () async {} : _register,
            onLogin: _openLogin,
          ),
        ),
      ),
    );
  }
}

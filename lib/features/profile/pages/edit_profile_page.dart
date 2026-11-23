import 'package:flutter/material.dart';
import 'package:memoryhome/providers/auth_providers.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/app_page_header.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/primary_button.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController namaController;
  late TextEditingController usernameController;
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();

    final user = context.read<AuthProvider>().user;

    namaController = TextEditingController(text: user?.namaLengkap ?? '');

    usernameController = TextEditingController(text: user?.username ?? '');

    emailController = TextEditingController(text: user?.email ?? '');
  }

  @override
  void dispose() {
    namaController.dispose();
    usernameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _simpanPerubahan() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Fitur simpan profil akan segera tersedia.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPageHeader(
                title: 'Edit Profil',
                subtitle: 'Informasi yang dikenali oleh keluargamu.',
                onBack: () => Navigator.pop(context),
              ),

              const SizedBox(height: 24),

              // Profile Avatar
              Center(
                child: Container(
                  width: 76,
                  height: 76,
                  decoration: const BoxDecoration(
                    color: AppColors.sage,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person_outline_rounded,
                    size: 38,
                    color: AppColors.primary,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Nama
              AppTextField(
                label: 'Nama',
                controller: namaController,
                hintText: 'Masukkan nama lengkap',
              ),

              const SizedBox(height: 18),

              // Username
              AppTextField(
                label: 'Username',
                controller: usernameController,
                hintText: 'Masukkan username',
              ),

              const SizedBox(height: 18),

              // Email
              AppTextField(
                label: 'Email',
                controller: emailController,
                hintText: 'Masukkan alamat email',
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 8),

              const Text(
                'Email ini digunakan untuk masuk dan menerima undangan rumah.',
                style: TextStyle(
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.textSecondary,
                ),
              ),

              const SizedBox(height: 28),

              // Simpan Perubahan
              PrimaryButton(
                text: 'Simpan Perubahan',
                onPressed: _simpanPerubahan,
              ),

              const SizedBox(height: 12),

              // Batal
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.surface,
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Batal',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:memoryhome/features/profile/pages/edit_profile_page.dart';

import '../widgets/profile_header.dart';
import '../widgets/profile_user_card.dart';
import '../widgets/profile_home_card.dart';
import '../widgets/profile_menu_section.dart';
import '../widgets/profile_menu_item.dart';

class ProfilePage extends StatelessWidget {
  final VoidCallback? onLogout;

  const ProfilePage({super.key, this.onLogout});

  void _showComingSoon(BuildContext context, String menu) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$menu akan segera tersedia.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text(
            'Keluar dari akun?',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color(0xFF252A27),
            ),
          ),
          content: const Text(
            'Kamu akan keluar dari akun MemoryHome. '
            'Yakin ingin melanjutkan?',
            style: TextStyle(color: Color(0xFF68726C), fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text(
                'Batal',
                style: TextStyle(color: Color(0xFF68726C)),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC5C5C),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Keluar'),
            ),
          ],
        );
      },
    );

    if (result == true && onLogout != null) {
      onLogout!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9F6),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const ProfileHeader(),

              const SizedBox(height: 22),

              // User Card
              ProfileUserCard(
                onEdit: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfilePage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),

              // Home Card
              const ProfileHomeCard(),

              const SizedBox(height: 26),

              // Menu: Rumah & Keluarga
              ProfileMenuSection(
                title: 'Rumah & Keluarga',
                items: [
                  ProfileMenuItem(
                    icon: Icons.home_outlined,
                    title: 'Rumah Saya',
                    subtitle: 'Kelola informasi rumah',
                    onTap: () => _showComingSoon(context, 'Rumah Saya'),
                  ),
                  ProfileMenuItem(
                    icon: Icons.people_outline,
                    title: 'Anggota Keluarga',
                    subtitle: 'Kelola anggota rumah',
                    onTap: () => _showComingSoon(context, 'Anggota Keluarga'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Menu: Preferensi
              ProfileMenuSection(
                title: 'Preferensi',
                items: [
                  ProfileMenuItem(
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifikasi',
                    subtitle: 'Atur pemberitahuan aplikasi',
                    onTap: () => _showComingSoon(context, 'Notifikasi'),
                  ),
                  ProfileMenuItem(
                    icon: Icons.palette_outlined,
                    title: 'Preferensi Tampilan',
                    subtitle: 'Atur tampilan aplikasi',
                    onTap: () =>
                        _showComingSoon(context, 'Preferensi Tampilan'),
                  ),
                  ProfileMenuItem(
                    icon: Icons.backup_outlined,
                    title: 'Backup Data',
                    subtitle: 'Amankan data barang milikmu',
                    onTap: () => _showComingSoon(context, 'Backup Data'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Menu: Informasi
              ProfileMenuSection(
                title: 'Informasi',
                items: [
                  ProfileMenuItem(
                    icon: Icons.help_outline_rounded,
                    title: 'Bantuan',
                    subtitle: 'Panduan penggunaan MemoryHome',
                    onTap: () => _showComingSoon(context, 'Bantuan'),
                  ),
                  ProfileMenuItem(
                    icon: Icons.info_outline_rounded,
                    title: 'Tentang Aplikasi',
                    subtitle: 'Informasi MemoryHome',
                    onTap: () => _showComingSoon(context, 'Tentang Aplikasi'),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Logout
              ProfileMenuSection(
                title: 'Akun',
                items: [
                  ProfileMenuItem(
                    icon: Icons.logout_rounded,
                    title: 'Keluar',
                    subtitle: 'Keluar dari akun MemoryHome',
                    isDanger: true,
                    onTap: () => _showLogoutDialog(context),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Footer
              const Center(
                child: Text(
                  'Rumahmu lupa, aplikasimu ingat.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF9AA49D),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Center(
                child: Text(
                  'MemoryHome',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF9AA49D),
                    letterSpacing: 1,
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

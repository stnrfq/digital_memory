import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:memoryhome/core/widgets/bottom_nav_bar.dart';
import 'package:memoryhome/features/home/pages/home_page.dart';
import 'package:memoryhome/features/profile/pages/profile_page.dart';
import 'package:memoryhome/features/auth/login/pages/login_page.dart';
import 'package:memoryhome/providers/auth_providers.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  late final List<Widget> _pages = [
    const HomePage(),
    const _TabPlaceholder(
      title: 'Barang',
      description: 'Daftar barang yang kamu simpan di rumah.',
      icon: Icons.inventory_2_outlined,
    ),
    const _TabPlaceholder(
      title: 'Ruangan',
      description: 'Kelola ruangan yang ada di rumahmu.',
      icon: Icons.door_front_door_outlined,
    ),
    ProfilePage(onLogout: _handleLogout),
  ];

  // LOGOUT
  Future<void> _handleLogout() async {
    // Hapus session dari Provider dan SharedPreferences
    await context.read<AuthProvider>().logout();

    if (!mounted) return;

    // Kembali ke Login dan hapus seluruh navigation stack
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: SafeArea(
        top: false,
        child: BottomNavBar(
          selectedIndex: _selectedIndex,
          onItemSelected: _onTabSelected,
        ),
      ),
    );
  }
}

class _TabPlaceholder extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const _TabPlaceholder({
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F6),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 76,
                  height: 76,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEAF0E8),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Icon(icon, size: 36, color: const Color(0xFF285C48)),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF252A27),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF68726C),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

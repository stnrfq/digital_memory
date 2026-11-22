import 'package:flutter/material.dart';
import 'package:memoryhome/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    // [Provider] Mengambil nama user dari state global
    final user = context.watch<AuthProvider>().user;

    final nama = user?.namaLengkap ?? 'Pengguna';

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, $nama!',
                style: const TextStyle(
                  color: Color(0xFF252A27),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.6,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Yuk, kelola barang-barang di rumahmu.',
                style: TextStyle(color: Color(0xFF68726C), fontSize: 12),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                size: 27,
                color: Color(0xFF252A27),
              ),
            ),
            Positioned(
              right: 10,
              top: 10,
              child: Container(
                width: 6,
                height: 6,
                decoration: const BoxDecoration(
                  color: Color(0xFF285C48),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        const CircleAvatar(
          radius: 17,
          backgroundColor: Color(0xFFEAF0E8),
          child: Icon(Icons.person_outline, color: Color(0xFF285C48), size: 23),
        ),
      ],
    );
  }
}

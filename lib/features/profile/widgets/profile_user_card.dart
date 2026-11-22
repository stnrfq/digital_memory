import 'package:flutter/material.dart';
import 'package:memoryhome/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class ProfileUserCard extends StatelessWidget {
  final VoidCallback onEdit;

  const ProfileUserCard({
    super.key,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().user;

    final nama = user?.namaLengkap ?? 'Pengguna';
    final email = user?.email ?? '';

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFE3E8E1),
        ),
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFE7EFE8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(
              Icons.person_outline,
              size: 34,
              color: Color(0xFF285C48),
            ),
          ),

          const SizedBox(width: 14),

          // Informasi pengguna
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nama,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF252A27),
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF68726C),
                  ),
                ),

                const SizedBox(height: 12),

                // Tombol Edit Profil
                InkWell(
                  onTap: onEdit,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE7EFE8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.edit_outlined,
                          size: 14,
                          color: Color(0xFF285C48),
                        ),
                        SizedBox(width: 6),
                        Text(
                          'Edit Profil',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF285C48),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
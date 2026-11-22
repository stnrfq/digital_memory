import 'package:flutter/material.dart';

class ProfileHomeCard extends StatelessWidget {
  const ProfileHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFE7EFE8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header card
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.7),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: const Icon(
                  Icons.home_outlined,
                  color: Color(0xFF285C48),
                  size: 23,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rumah Saya',
                      style: TextStyle(fontSize: 12, color: Color(0xFF68726C)),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Rumah Utama',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF252A27),
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14,
                color: Color(0xFF285C48),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Statistik rumah
          Row(
            children: [
              _buildStatistic(
                icon: Icons.inventory_2_outlined,
                value: '128',
                label: 'Barang',
              ),
              _buildDivider(),
              _buildStatistic(
                icon: Icons.door_front_door_outlined,
                value: '6',
                label: 'Ruangan',
              ),
              _buildDivider(),
              _buildStatistic(
                icon: Icons.people_outline,
                value: '3',
                label: 'Anggota',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic({
    required IconData icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Column(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF285C48)),
          const SizedBox(height: 7),
          Text(
            value,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Color(0xFF252A27),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(fontSize: 11, color: Color(0xFF68726C)),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(width: 1, height: 48, color: const Color(0xFFD0DDD2));
  }
}

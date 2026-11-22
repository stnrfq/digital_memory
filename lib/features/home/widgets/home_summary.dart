import 'package:flutter/material.dart';

class HomeSummary extends StatelessWidget {
  const HomeSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF285C48),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Expanded(
            child: _SummaryItem(
              icon: Icons.inventory_2_outlined,
              number: '128',
              unit: 'barang',
              label: 'Total Barang',
            ),
          ),
          _divider(),
          const Expanded(
            child: _SummaryItem(
              icon: Icons.door_front_door_outlined,
              number: '5',
              unit: 'ruangan',
              label: 'Total Ruangan',
            ),
          ),
          _divider(),
          const Expanded(
            child: _SummaryItem(
              icon: Icons.grid_view_outlined,
              number: '8',
              unit: 'kategori',
              label: 'Kategori',
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Container(
      width: 1,
      height: 60,
      color: Colors.white.withValues(alpha: 0.15),
      margin: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  final IconData icon;
  final String number;
  final String unit;
  final String label;

  const _SummaryItem({
    required this.icon,
    required this.number,
    required this.unit,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFFA8BDA9),
        ),
        const SizedBox(height: 6),
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                number,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 3),
              Text(
                unit,
                style: const TextStyle(
                  color: Color(0xFFDFE8DE),
                  fontSize: 10,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xFFDFE8DE),
            fontSize: 10.5,
          ),
        ),
      ],
    );
  }
}

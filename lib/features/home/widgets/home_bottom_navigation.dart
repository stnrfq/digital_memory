import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const HomeBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  static const List<IconData> icons = [
    Icons.home_outlined,
    Icons.inventory_2_outlined,
    Icons.door_front_door_outlined,
    Icons.person_outline,
  ];

  static const List<String> labels = [
    'Beranda',
    'Barang',
    'Ruangan',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE3E8E1),
          ),
        ),
      ),
      child: Row(
        children: List.generate(
          labels.length,
          (index) {
            final isSelected = selectedIndex == index;

            return Expanded(
              child: InkWell(
                onTap: () => onItemSelected(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 29,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFFEAF0E8)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Icon(
                        icons[index],
                        size: 22,
                        color: isSelected
                            ? const Color(0xFF285C48)
                            : const Color(0xFF68726C),
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      labels[index],
                      style: TextStyle(
                        color: isSelected
                            ? const Color(0xFF285C48)
                            : const Color(0xFF68726C),
                        fontSize: 10,
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

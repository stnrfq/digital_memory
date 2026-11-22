import 'package:flutter/material.dart';

class HomeSearch extends StatelessWidget {
  final VoidCallback onAdd;

  const HomeSearch({super.key, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFE3E8E1)),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Color(0xFF68726C), size: 23),

                const SizedBox(width: 8),

                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari barang yang kamu simpan...',
                      hintStyle: TextStyle(
                        color: Color(0xFF68726C),
                        fontSize: 12,
                      ),
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 32,
                    minHeight: 32,
                  ),
                  icon: const Icon(
                    Icons.tune,
                    color: Color(0xFF285C48),
                    size: 21,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(width: 8),

        SizedBox(
          width: 44,
          height: 48,
          child: ElevatedButton(
            onPressed: onAdd,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF285C48),
              foregroundColor: Colors.white,
              padding: EdgeInsets.zero,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Icon(Icons.add, size: 25),
          ),
        ),
      ],
    );
  }
}

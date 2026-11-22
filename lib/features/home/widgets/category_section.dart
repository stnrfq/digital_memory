import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      _CategoryData(
        'Elektronik', '28 barang',
        Icons.cable_outlined, Color(0xFFEAF0E8),
      ),
      _CategoryData(
        'Dokumen', '16 barang',
        Icons.description_outlined, Color(0xFFF7F0DD),
      ),
      _CategoryData(
        'Peralatan Rumah', '24 barang',
        Icons.chair_alt_outlined, Color(0xFFEAF0F2),
      ),
      _CategoryData(
        'Perkakas', '12 barang',
        Icons.build_outlined, Color(0xFFF3ECE5),
      ),
      _CategoryData(
        'Pakaian', '20 barang',
        Icons.checkroom_outlined, Color(0xFFEFEDF3),
      ),
      _CategoryData(
        'Lainnya', '10 barang',
        Icons.widgets_outlined, Color(0xFFEAF0E8),
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kategori Barang',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Color(0xFF252A27),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Lihat Semua',
                style: TextStyle(
                  color: Color(0xFF285C48),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            mainAxisExtent: 76,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];

            return _CategoryCard(category: category);
          },
        ),
      ],
    );
  }
}

class _CategoryData {
  final String name;
  final String count;
  final IconData icon;
  final Color color;

  _CategoryData(
    this.name,
    this.count,
    this.icon,
    this.color,
  );
}

class _CategoryCard extends StatelessWidget {
  final _CategoryData category;
  const _CategoryCard({required this.category});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            category.icon,
            size: 20,
            color: const Color(0xFF285C48),
          ),
          const Spacer(),
          Text(
            category.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Color(0xFF252A27),
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            category.count,
            style: const TextStyle(
              color: Color(0xFF68726C),
              fontSize: 10.5,
            ),
          ),
        ],
      ),
    );
  }
}

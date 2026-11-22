import 'package:flutter/material.dart';

import '../../barang/models/barang_model.dart';
import '../../barang/services/barang_service.dart';

class RecentItemsSection extends StatefulWidget {
  final int refreshKey;

  const RecentItemsSection({super.key, this.refreshKey = 0});

  @override
  State<RecentItemsSection> createState() => _RecentItemsSectionState();
}

class _RecentItemsSectionState extends State<RecentItemsSection> {
  final BarangService _barangService = BarangService();

  List<BarangModel> daftarBarang = [];

  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    ambilBarang();
  }

  // Memuat data barang dari API
  Future<void> ambilBarang() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final data = await _barangService.getBarang();

      if (!mounted) return;

      setState(() {
        // Hanya menampilkan 3 barang terbaru
        daftarBarang = data.take(3).toList();
        isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  // Memuat ulang ketika refreshKey berubah
  @override
  void didUpdateWidget(covariant RecentItemsSection oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.refreshKey != widget.refreshKey) {
      ambilBarang();
    }
  }

  // Ikon berdasarkan kategori barang
  IconData getIconKategori(String kategori) {
    switch (kategori.toLowerCase()) {
      case 'elektronik':
        return Icons.cable_rounded;

      case 'dokumen':
        return Icons.description_outlined;

      case 'peralatan rumah':
      case 'perkakas':
        return Icons.handyman_outlined;

      case 'pakaian':
        return Icons.checkroom_outlined;

      case 'makanan':
        return Icons.restaurant_outlined;

      default:
        return Icons.inventory_2_outlined;
    }
  }

  // Widget ketika belum ada barang
  Widget tampilanKosong() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE3E8E1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        children: [
          Icon(Icons.inventory_2_outlined, size: 38, color: Color(0xFF9BA99D)),
          SizedBox(height: 10),
          Text(
            'Belum Ada Barang',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF252A27),
            ),
          ),
          SizedBox(height: 5),
          Text(
            'Barang yang kamu tambahkan akan muncul di sini.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 11, color: Color(0xFF68726C)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Barang Terbaru
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Barang Terbaru',
              style: TextStyle(
                color: Color(0xFF252A27),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),

            Text(
              'Lihat Semua',
              style: TextStyle(
                color: const Color(0xFF285C48),
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

        // Loading
        if (isLoading)
          const Padding(
            padding: EdgeInsets.all(25),
            child: Center(
              child: CircularProgressIndicator(color: Color(0xFF285C48)),
            ),
          )
        // Error
        else if (errorMessage != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE3E8E1)),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.cloud_off_outlined,
                  color: Colors.orange,
                  size: 32,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Gagal memuat barang',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Text(
                  errorMessage!,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 11,
                    color: Color(0xFF68726C),
                  ),
                ),
                TextButton(
                  onPressed: ambilBarang,
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          )
        // Data kosong
        else if (daftarBarang.isEmpty)
          tampilanKosong()
        // Daftar barang dari database
        else
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: daftarBarang.length,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return _RecentItemCard(
                item: daftarBarang[index],
                icon: getIconKategori(daftarBarang[index].kategori),
              );
            },
          ),
      ],
    );
  }
}

// Kartu barang
class _RecentItemCard extends StatelessWidget {
  final BarangModel item;
  final IconData icon;

  const _RecentItemCard({required this.item, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE3E8E1)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Ikon barang
          Container(
            width: 64,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0E8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 30, color: const Color(0xFF285C48)),
          ),

          const SizedBox(width: 12),

          // Informasi barang
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.namaBarang,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Color(0xFF252A27),
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const Icon(Icons.chevron_right, color: Color(0xFF68726C)),
                  ],
                ),

                const SizedBox(height: 3),

                Text(
                  item.kategori,
                  style: const TextStyle(
                    color: Color(0xFF285C48),
                    fontSize: 11,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  item.lokasi,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xFF68726C),
                    fontSize: 12,
                  ),
                ),

                const SizedBox(height: 4),

                const Text(
                  'Barang tersimpan',
                  style: TextStyle(color: Color(0xFF68726C), fontSize: 10.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

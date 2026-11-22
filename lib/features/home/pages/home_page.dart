import 'package:flutter/material.dart';

import '../../barang/pages/tambah_barang_page.dart';

import '../widgets/home_header.dart';
import '../widgets/home_search.dart';
import '../widgets/home_summary.dart';
import '../widgets/category_section.dart';
import '../widgets/recent_items_section.dart';
import '../widgets/room_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // Digunakan untuk memuat ulang daftar barang
  int refreshKey = 0;

  // Membuka halaman tambah barang
  Future<void> bukaTambahBarang() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TambahBarangPage()),
    );

    // Refresh hanya jika barang berhasil disimpan
    if (!mounted) return;

    if (result == true) {
      setState(() {
        refreshKey++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9F6),

      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeHeader(),

              const SizedBox(height: 22),

              // Search dan tombol tambah barang
              HomeSearch(onAdd: () => bukaTambahBarang()),

              const SizedBox(height: 24),

              const HomeSummary(),

              const SizedBox(height: 24),

              const CategorySection(),

              const SizedBox(height: 24),

              // Barang terbaru dari database
              RecentItemsSection(refreshKey: refreshKey),

              const SizedBox(height: 24),

              const RoomSection(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

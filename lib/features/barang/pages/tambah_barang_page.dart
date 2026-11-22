import 'package:flutter/material.dart';

import '../models/barang_model.dart';
import '../services/barang_service.dart';

class TambahBarangPage extends StatefulWidget {
  const TambahBarangPage({super.key});

  @override
  State<TambahBarangPage> createState() => _TambahBarangPageState();
}

class _TambahBarangPageState extends State<TambahBarangPage> {
  final _formKey = GlobalKey<FormState>();

  final _namaController = TextEditingController();
  final _lokasiController = TextEditingController();
  final _deskripsiController = TextEditingController();

  final BarangService _barangService = BarangService();

  String? _kategori;
  bool _isLoading = false;

  final List<String> _kategoriList = [
    'Elektronik',
    'Peralatan Rumah',
    'Dokumen',
    'Pakaian',
    'Makanan',
    'Lainnya',
  ];

  Future<void> simpanBarang() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final barang = BarangModel(
        namaBarang: _namaController.text.trim(),
        kategori: _kategori!,
        lokasi: _lokasiController.text.trim(),
        deskripsi: _deskripsiController.text.trim(),
      );

      final result = await _barangService.tambahBarang(barang);

      if (!mounted) return;

      if (result['success'] == true) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message']),
            backgroundColor: Colors.green,
          ),
        );

        Navigator.pop(context, true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(result['message'] ?? 'Gagal menambahkan barang'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Terjadi kesalahan: $e'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _namaController.dispose();
    _lokasiController.dispose();
    _deskripsiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Barang')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Informasi Barang',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              // Nama Barang
              TextFormField(
                controller: _namaController,
                decoration: const InputDecoration(
                  labelText: 'Nama Barang',
                  hintText: 'Contoh: Laptop ASUS',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Nama barang wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Kategori
              DropdownButtonFormField<String>(
                initialValue: _kategori,
                decoration: const InputDecoration(
                  labelText: 'Kategori Barang',
                  border: OutlineInputBorder(),
                ),
                items: _kategoriList.map((kategori) {
                  return DropdownMenuItem(
                    value: kategori,
                    child: Text(kategori),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _kategori = value;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return 'Silakan pilih kategori';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Lokasi
              TextFormField(
                controller: _lokasiController,
                decoration: const InputDecoration(
                  labelText: 'Lokasi Penyimpanan',
                  hintText: 'Contoh: Kamar',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Lokasi wajib diisi';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              // Deskripsi
              TextFormField(
                controller: _deskripsiController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Deskripsi',
                  hintText: 'Tambahkan keterangan barang...',
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
              ),

              const SizedBox(height: 28),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : simpanBarang,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Simpan Barang'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

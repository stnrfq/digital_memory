class BarangModel {
  final int? idBarang;
  final String namaBarang;
  final String kategori;
  final String lokasi;
  final String deskripsi;

  BarangModel({
    this.idBarang,
    required this.namaBarang,
    required this.kategori,
    required this.lokasi,
    required this.deskripsi,
  });

  // CREATE: Mengubah objek Barang menjadi JSON
  Map<String, dynamic> toJson() {
    return {
      'nama_barang': namaBarang,
      'kategori': kategori,
      'lokasi': lokasi,
      'deskripsi': deskripsi,
    };
  }

  // READ: Mengubah JSON API menjadi objek Barang
  factory BarangModel.fromJson(Map<String, dynamic> json) {
    return BarangModel(
      idBarang: int.tryParse(json['id_barang']?.toString() ?? ''),
      namaBarang: json['nama_barang']?.toString() ?? '',
      kategori: json['kategori']?.toString() ?? '',
      lokasi: json['lokasi']?.toString() ?? '',
      deskripsi: json['deskripsi']?.toString() ?? '',
    );
  }
}

import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/barang_model.dart';

class BarangService {
  final Dio _dio = Dio();

  static const String baseUrl = 'http://192.168.1.14/digital_memory_api/';

  // Mengubah respons API menjadi Map
  Map<String, dynamic> parseResponse(dynamic data) {
    dynamic decodedData = data;

    // Jika respons masih String, ubah menjadi JSON
    if (data is String) {
      decodedData = jsonDecode(data);
    }

    if (decodedData is Map) {
      return Map<String, dynamic>.from(decodedData);
    }

    throw FormatException('Format respons API tidak valid: $data');
  }

  // CREATE: Menambahkan barang
  Future<Map<String, dynamic>> tambahBarang(BarangModel barang) async {
    try {
      final response = await _dio.post(
        '${baseUrl}create_barang.php',
        data: barang.toJson(),
      );

      return parseResponse(response.data);
    } on DioException catch (e) {
      throw Exception('Koneksi API gagal: ${e.message}');
    } on FormatException catch (e) {
      throw Exception(e.message);
    }
  }

  // READ: Mengambil seluruh barang
  Future<List<BarangModel>> getBarang() async {
    try {
      final response = await _dio.get('${baseUrl}get_barang.php');

      final data = parseResponse(response.data);

      if (data['success'] == true) {
        final List daftarData = data['data'] ?? [];

        return daftarData.map((item) {
          return BarangModel.fromJson(Map<String, dynamic>.from(item));
        }).toList();
      }

      throw Exception(data['message'] ?? 'Gagal mengambil data barang');
    } on DioException catch (e) {
      throw Exception('Koneksi API gagal: ${e.message}');
    } on FormatException catch (e) {
      throw Exception(e.message);
    }
  }
}

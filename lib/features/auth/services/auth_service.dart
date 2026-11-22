
import 'package:dio/dio.dart';
import '../models/user_model.dart';

class AuthService {
  final Dio _dio = Dio();

  // Ganti IP sesuai alamat IP laptop/server kamu
  // Jika menggunakan emulator Android, localhost tidak bisa digunakan langsung.
  static const String baseUrl = 'http://192.168.1.14/digital_memory_api';

  // =========================
  // REGISTER
  // =========================
  Future<UserModel> register({
    required String namaLengkap,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "$baseUrl/register.php",
        data: {
          'nama_lengkap': namaLengkap,
          'username': username,
          'email': email,
          'password': password,
        },
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      final responseData = response.data;

      if (responseData['success'] == true) {
        return UserModel.fromJson(responseData['data']);
      }

      throw Exception(
        responseData['message'] ?? 'Registrasi gagal',
      );
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data is Map && data['message'] != null) {
        throw Exception(data['message']);
      }

      throw Exception('Tidak dapat terhubung ke server');
    }
  }

  // =========================
  // LOGIN
  // =========================
  Future<UserModel> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "$baseUrl/login.php",
        data: {
          'identifier': identifier,
          'password': password,
        },
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      final responseData = response.data;

      if (responseData['success'] == true) {
        return UserModel.fromJson(responseData['data']);
      }

      throw Exception(
        responseData['message'] ?? 'Login gagal',
      );
    } on DioException catch (e) {
      final data = e.response?.data;

      if (data is Map && data['message'] != null) {
        throw Exception(data['message']);
      }

      throw Exception('Tidak dapat terhubung ke server');
    }
  }
}

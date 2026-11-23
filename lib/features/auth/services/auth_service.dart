import 'package:dio/dio.dart';

import '../models/user_model.dart';
import '../models/auth_session_model.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 10),
    ),
  );

  static const String baseUrl = 'http://10.0.167.195/digital_memory_api';

  // =========================
  // HELPER ERROR RESPONSE
  // =========================
  String _getErrorMessage(dynamic data, String fallback) {
    if (data is Map && data['message'] != null) {
      return data['message'].toString();
    }

    return fallback;
  }

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
      );

      final data = response.data;

      if (data is Map && data['success'] == true) {
        return UserModel.fromJson(data['data']);
      }

      throw Exception(_getErrorMessage(data, 'Registrasi gagal'));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception('Server terlalu lama merespons');
      }

      throw Exception(
        _getErrorMessage(e.response?.data, 'Tidak dapat terhubung ke server'),
      );
    }
  }

  // =========================
  // LOGIN
  // =========================
  Future<AuthSessionModel> login({
    required String identifier,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "$baseUrl/login.php",
        data: {'identifier': identifier, 'password': password},
      );

      final data = response.data;

      if (data is Map && data['success'] == true) {
        return AuthSessionModel.fromJson(Map<String, dynamic>.from(data));
      }

      throw Exception(_getErrorMessage(data, 'Login gagal'));
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        throw Exception('Server terlalu lama merespons');
      }

      throw Exception(
        _getErrorMessage(
          e.response?.data,
          'Username/email atau password salah',
        ),
      );
    }
  }

  // =========================
  // CHECK SESSION
  // =========================
  Future<UserModel> checkSession(String token) async {
    try {
      final response = await _dio.post(
        "$baseUrl/check_session.php",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final data = response.data;

      if (data is Map && data['success'] == true && data['valid'] == true) {
        return UserModel.fromJson(data['data']);
      }

      throw Exception(_getErrorMessage(data, 'Sesi tidak valid'));
    } on DioException catch (e) {
      throw Exception(
        _getErrorMessage(e.response?.data, 'Gagal memvalidasi sesi'),
      );
    }
  }

  // =========================
  // LOGOUT
  // =========================
  Future<void> logout(String token) async {
    try {
      final response = await _dio.post(
        "$baseUrl/logout.php",
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      final data = response.data;

      if (data is Map && data['success'] == true) {
        return;
      }

      throw Exception(_getErrorMessage(data, 'Logout gagal'));
    } on DioException catch (e) {
      throw Exception(
        _getErrorMessage(
          e.response?.data,
          'Tidak dapat menghubungi server saat logout',
        ),
      );
    }
  }
}

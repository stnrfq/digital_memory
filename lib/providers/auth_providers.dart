import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/auth/models/user_model.dart';
import '../features/auth/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();

  UserModel? _user;
  bool _isLoggedIn = false;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  // =========================
  // LOAD & VALIDATE SESSION
  // =========================
  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null || token.isEmpty) {
      _user = null;
      _isLoggedIn = false;
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Validasi token ke server
      final user = await _authService.checkSession(token);

      // Sesi valid, update data user
      await prefs.setBool('isLoggedIn', true);
      await prefs.setInt('id_user', user.idUser);
      await prefs.setString('nama_lengkap', user.namaLengkap);
      await prefs.setString('username', user.username);
      await prefs.setString('email', user.email);

      _user = user;
      _isLoggedIn = true;
    } catch (e) {
      // Token invalid, expired, atau server tidak dapat memvalidasi
      await _clearLocalSession();

      _user = null;
      _isLoggedIn = false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // LOGIN
  // =========================
  Future<void> login({
    required String identifier,
    required String password,
  }) async {
    _isLoading = true;
    notifyListeners();

    try {
      final session = await _authService.login(
        identifier: identifier,
        password: password,
      );

      final user = session.user;
      final token = session.token;

      if (token.isEmpty) {
        throw Exception('Token login tidak diterima server');
      }

      final prefs = await SharedPreferences.getInstance();

      await prefs.setString('auth_token', token);
      await prefs.setBool('isLoggedIn', true);
      await prefs.setInt('id_user', user.idUser);
      await prefs.setString('nama_lengkap', user.namaLengkap);
      await prefs.setString('username', user.username);
      await prefs.setString('email', user.email);

      _user = user;
      _isLoggedIn = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // =========================
  // LOGOUT
  // =========================
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    try {
      // Cabut sesi di server terlebih dahulu
      if (token != null && token.isNotEmpty) {
        await _authService.logout(token);
      }
    } catch (_) {
      // Tetap hapus sesi lokal meskipun server gagal dihubungi.
    } finally {
      // Hapus data sesi lokal
      await _clearLocalSession();

      _user = null;
      _isLoggedIn = false;

      notifyListeners();
    }
  }

  // =========================
  // CLEAR LOCAL SESSION
  // =========================
  Future<void> _clearLocalSession() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove('auth_token');
    await prefs.remove('isLoggedIn');
    await prefs.remove('id_user');
    await prefs.remove('nama_lengkap');
    await prefs.remove('username');
    await prefs.remove('email');
  }
}

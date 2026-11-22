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
  // LOAD SESSION
  // =========================
  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();

    final loggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!loggedIn) {
      _user = null;
      _isLoggedIn = false;
      notifyListeners();
      return;
    }

    final idUser = prefs.getInt('id_user');

    if (idUser == null) {
      _user = null;
      _isLoggedIn = false;
      await prefs.clear();
      notifyListeners();
      return;
    }

    _user = UserModel(
      idUser: idUser,
      namaLengkap: prefs.getString('nama_lengkap') ?? '',
      username: prefs.getString('username') ?? '',
      email: prefs.getString('email') ?? '',
    );

    _isLoggedIn = true;
    notifyListeners();
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
      final user = await _authService.login(
        identifier: identifier,
        password: password,
      );

      final prefs = await SharedPreferences.getInstance();

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

    await prefs.remove('isLoggedIn');
    await prefs.remove('id_user');
    await prefs.remove('nama_lengkap');
    await prefs.remove('username');
    await prefs.remove('email');

    _user = null;
    _isLoggedIn = false;

    notifyListeners();
  }
}

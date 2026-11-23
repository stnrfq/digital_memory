import 'user_model.dart';

class AuthSessionModel {
  final UserModel user;
  final String token;
  final String? expiresAt;

  AuthSessionModel({required this.user, required this.token, this.expiresAt});

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    return AuthSessionModel(
      user: UserModel.fromJson(json['data']),
      token: json['token'] ?? '',
      expiresAt: json['expires_at'],
    );
  }
}

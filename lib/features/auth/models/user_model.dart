class UserModel {
  final int idUser;
  final String namaLengkap;
  final String username;
  final String email;

  UserModel({
    required this.idUser,
    required this.namaLengkap,
    required this.username,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: int.parse(json['id_user'].toString()),
      namaLengkap: json['nama_lengkap'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'nama_lengkap': namaLengkap,
      'username': username,
      'email': email,
    };
  }
}

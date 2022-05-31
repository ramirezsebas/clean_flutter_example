import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.nombre,
    super.fechaNacimiento,
    super.email,
    super.avatar,
    super.sexo,
  });

  factory UserModel.fromRemoteJson(Map<String, dynamic> json) {
    final Map<String, dynamic> userData = json['data'];
    return UserModel(
      id: userData['id'],
      nombre: "${userData['first_name']} ${userData['last_name']}",
      avatar: userData['avatar'],
      email: userData['email'],
    );
  }

  Map<String, dynamic> toRemoteJson() {
    final splitName = nombre.split(' ');
    final String firstName = splitName[0];
    final String lastName = splitName[1];
    return {
      "id": id,
      "first_name": firstName,
      "last_name": lastName,
      "avatar": avatar,
      "email": email,
    };
  }
}

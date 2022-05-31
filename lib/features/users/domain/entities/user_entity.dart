import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String nombre;
  final String? email;
  final String? avatar;
  final DateTime? fechaNacimiento;
  final String? sexo;

  const User({
    required this.id,
    required this.nombre,
    this.fechaNacimiento,
    this.email,
    this.avatar,
    this.sexo,
  });

  @override
  List<Object?> get props => [
        nombre,
        email,
        avatar,
        fechaNacimiento,
        sexo,
      ];
}

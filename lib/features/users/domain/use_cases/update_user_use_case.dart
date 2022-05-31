import 'package:dartz/dartz.dart';
import 'package:flutter_test_itti/core/errors/failure.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';

class UpdateUserUseCase {
  final UserRepository repository;

  const UpdateUserUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(int id, User user) {
    return repository.updateUser(id: id, user: user);
  }
}

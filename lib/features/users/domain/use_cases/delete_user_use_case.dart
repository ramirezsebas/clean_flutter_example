import 'package:dartz/dartz.dart';
import 'package:flutter_test_itti/core/errors/failure.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';

class DeleteUserUseCase {
  final UserRepository repository;

  DeleteUserUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(int id) {
    return repository.deleteUserById(id);
  }
}

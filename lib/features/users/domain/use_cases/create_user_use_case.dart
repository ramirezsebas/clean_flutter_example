import 'package:dartz/dartz.dart';
import 'package:flutter_test_itti/core/errors/failure.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';

class CreateUserUseCase {
  final UserRepository repository;

  CreateUserUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(User user) {
    return repository.createUser(user: user);
  }
}

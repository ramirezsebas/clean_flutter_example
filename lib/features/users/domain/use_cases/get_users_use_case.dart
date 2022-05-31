import 'package:dartz/dartz.dart';
import 'package:flutter_test_itti/core/errors/failure.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';

class GetUsersUseCase {
  final UserRepository repository;

  GetUsersUseCase({required this.repository});

  Future<Either<Failure, List<User>>> call() {
    return repository.getUsers();
  }
}

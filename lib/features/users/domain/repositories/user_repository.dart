import 'package:dartz/dartz.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers();
  Future<Either<Failure, User>> getUserById(int id);
  Future<Either<Failure, Unit>> deleteUserById(int id);
  Future<Either<Failure, Unit>> createUser({required User user});
  Future<Either<Failure, Unit>> updateUser({
    required int id,
    required User user,
  });
}

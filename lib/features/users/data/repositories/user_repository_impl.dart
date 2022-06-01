import 'package:flutter_test_itti/core/errors/exceptions.dart';
import 'package:flutter_test_itti/features/users/data/data_sources/user_remote_data_source.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';
import 'package:flutter_test_itti/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remote;

  UserRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, Unit>> createUser({required User user}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> deleteUserById(int id) {
    // TODO: implement deleteUserById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, User>> getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      final response = await remote.getUsers();
      return Right(response);
    } on ServerException {
      Left(ServerFailure());
    }
    return const Right([]);
  }

  @override
  Future<Either<Failure, Unit>> updateUser(
      {required int id, required User user}) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}

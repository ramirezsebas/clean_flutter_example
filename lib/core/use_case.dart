import 'package:dartz/dartz.dart';
import 'package:flutter_test_itti/core/errors/failure.dart';

abstract class UseCase<T> {
  Future<Either<Failure, T>> call();
}

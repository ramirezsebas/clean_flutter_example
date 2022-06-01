import 'package:dio/dio.dart';
import 'package:flutter_test_itti/core/errors/exceptions.dart';
import 'package:flutter_test_itti/features/users/data/models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSourceImpl({required Dio client}) : _dio = client;

  @override
  Future<List<UserModel>> getUsers() async {
    var response = await _dio.get("https://reqres.in/api/users/");
    if (response.statusCode == 200) {
      return response.data.map((e) => UserModel.fromRemoteJson(e));
    } else {
      throw ServerException();
    }
  }
}

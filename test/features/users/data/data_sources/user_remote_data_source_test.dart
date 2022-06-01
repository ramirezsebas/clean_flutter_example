import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_itti/features/users/data/data_sources/user_remote_data_source.dart';
import 'package:flutter_test_itti/features/users/data/repositories/user_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../fixtures/json_to_map.dart';

class MockRemoteDataSource extends Mock implements Dio {}

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late UserRemoteDataSourceImpl userDataSourceImpl;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    userDataSourceImpl = UserRemoteDataSourceImpl(client: mockRemoteDataSource);
  });

  test(
    "Peticion a usuarios",
    () async {
      when(() => mockRemoteDataSource.get(any())).thenAnswer(
        (_) async => Response(
          data: jsonToMap("test/fixtures/users.json"),
          statusCode: 200,
          requestOptions: RequestOptions(path: ""),
        ),
      );

      final results = await userDataSourceImpl.getUsers();

      verify(
        () => mockRemoteDataSource.get(
          'https://reqres.in/api/users/',
        ),
      );
    },
  );
}

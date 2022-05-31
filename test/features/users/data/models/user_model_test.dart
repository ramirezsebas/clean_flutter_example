import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_itti/features/users/data/models/user_model.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';

import '../../../../fixtures/json_to_map.dart';

void main() {
  const tUserId = 1;

  const tUserModel = UserModel(
    id: 1,
    nombre: "George Bluth",
    email: "george.bluth@reqres.in",
    avatar: "https://reqres.in/img/faces/1-image.jpg",
  );

  test("UserModel es una instance de User", () {
    expect(tUserModel, isA<User>());
  });

  final json = jsonToMap("test/fixtures/user.json");
  final user = UserModel.fromRemoteJson(json);
  test("From Json", () {
    expect(user, tUserModel);
  });

  test("To Json", () {
    final map = user.toRemoteJson();
    expect(map, json['data']);
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';
import 'package:flutter_test_itti/features/users/domain/use_cases/update_user_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;
  late UpdateUserUseCase useCase;

  setUp(() {
    userRepository = MockUserRepository();
    useCase = UpdateUserUseCase(repository: userRepository);
  });

  const tUserId = 1;

  final tUser = User(
    id: 1,
    nombre: "Nombre 1",
    fechaNacimiento: DateTime.now(),
    sexo: 'M',
  );

  //Arrange
  final List<User> tUsers = [
    User(
      id: 1,
      nombre: "Nombre 1",
      fechaNacimiento: DateTime.now(),
      sexo: 'M',
    ),
    User(
      id: 2,
      nombre: "Nombre 2",
      fechaNacimiento: DateTime.now(),
      sexo: 'F',
    ),
    User(
      id: 3,
      nombre: "Nombre 3",
      fechaNacimiento: DateTime.now(),
      sexo: 'M',
    ),
  ];

  test("Deberia actualizar un usuario", () async {
    //Act
    when(() => userRepository.updateUser(id: tUserId, user: tUser))
        .thenAnswer((invocation) async => const Right(unit));

    final result = await useCase(tUserId, tUser);

    // //Assert
    expect(result, const Right(unit));
    verify(() => userRepository.updateUser(id: tUserId, user: tUser));
    verifyNoMoreInteractions(userRepository);
  });
}

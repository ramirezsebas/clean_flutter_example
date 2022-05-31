import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';
import 'package:flutter_test_itti/features/users/domain/use_cases/create_user_use_case.dart';
import 'package:flutter_test_itti/features/users/domain/use_cases/get_user_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;
  late CreateUserUseCase useCase;

  setUp(() {
    userRepository = MockUserRepository();
    useCase = CreateUserUseCase(repository: userRepository);
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

  test("No Deberia traer nada del para la creacion del usuario", () async {
    //Act
    when(() => userRepository.createUser(user: tUser))
        .thenAnswer((invocation) async => const Right(unit));

    final result = await useCase(tUser);

    // //Assert
    expect(result, const Right(unit));
    verify(() => userRepository.createUser(user: tUser));
    verifyNoMoreInteractions(userRepository);
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';
import 'package:flutter_test_itti/features/users/domain/use_cases/get_user_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;
  late GetUserUseCase useCase;

  setUp(() {
    userRepository = MockUserRepository();
    useCase = GetUserUseCase(repository: userRepository);
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

  test("Deberia traer una lista de usuarios del repositorio", () async {
    //Act
    when(() => userRepository.getUserById(any()))
        .thenAnswer((invocation) async => Right(tUser));

    final result = await useCase(tUserId);

    //Assert
    expect(result, Right(tUser));
    verify(() => userRepository.getUserById(any()));
    verifyNoMoreInteractions(userRepository);
  });
}

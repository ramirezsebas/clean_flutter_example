import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_itti/features/users/domain/entities/user_entity.dart';
import 'package:flutter_test_itti/features/users/domain/repositories/user_repository.dart';
import 'package:flutter_test_itti/features/users/domain/use_cases/get_users_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  late MockUserRepository userRepository;
  late GetUsersUseCase useCase;

  setUp(() {
    userRepository = MockUserRepository();
    useCase = GetUsersUseCase(repository: userRepository);
  });

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
    when(userRepository.getUsers)
        .thenAnswer((invocation) async => Right(tUsers));

    final result = await useCase();

    //Assert
    expect(result, Right(tUsers));
    verify(() => userRepository.getUsers());
    verifyNoMoreInteractions(userRepository);
  });
}

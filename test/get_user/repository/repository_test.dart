import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tecnofit_test/core/core.dart';

class MockDataSourceUsers extends Mock implements AbstractDataSourceUsers {}

void main() {
  final sl = GetIt.instance;

  late RepositoryUsers repositoryUsers;
  late MockDataSourceUsers mockDataSourceUsers;

  setUp(() {
    sl.reset();

    mockDataSourceUsers = MockDataSourceUsers();

    sl.registerSingleton<AbstractDataSourceUsers>(mockDataSourceUsers);

    repositoryUsers = RepositoryUsers();
  });

  group('RepositoryUsers', () {
    test('deve retornar sucesso ao obter usuário com status 200', () async {
      when(() => mockDataSourceUsers.dataSourceGetUsers(any<int>(), any<Map<String,dynamic>>()))
          .thenAnswer((_) async => StateGenerics.success(data: <String, dynamic>{}));

      final result = await repositoryUsers.repositoryUsers(1);

      expect(result.data, isNotNull);
    });

    test('deve retornar erro quando o dataSource lançar exceção', () async {
      // Simula uma exceção no DataSource
      when(() => mockDataSourceUsers.dataSourceGetUsers(any<int>(), any<Map<String,dynamic>>()))
          .thenThrow(Exception());

      // Chama o método do repositório
      final result = await repositoryUsers.repositoryUsers(1);

      // Verifica se o retorno foi erro
      expect(result.error, ErrorEnum.error);
    });
  });
}

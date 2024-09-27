import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tecnofit_test/core/core.dart'; // Importe o núcleo do seu projeto

class MockRemoteClient extends Mock implements AbstractRemoteClient {}

void main() {
final sl = GetIt.instance;

  late DataSourceUsers dataSourceUsers;
  late MockRemoteClient mockRemoteClient;

  setUp(() {
    mockRemoteClient = MockRemoteClient();
    sl.registerSingleton<AbstractRemoteClient>(mockRemoteClient);
    dataSourceUsers = DataSourceUsers();
  });

  group('DataSourceUsers', () {
    test('retorna sucesso ao obter usuários com status 200', () async {
      // Simula uma resposta bem-sucedida
      when(() => mockRemoteClient.get(any<String>(), any<Map<String, dynamic>?>())).thenAnswer((_) async => ResponseGenerics(
        statusCode: 200,
        data: {},
      ));

      final result = await dataSourceUsers.dataSourceGetUsers(1, {});
      expect(result.data, isNotNull);
      expect(result.data, {});
    });

    test('retorna erro ao obter usuários com status diferente de 200', () async {
      // Simula uma resposta de erro
      when(() => mockRemoteClient.get(any(), any())).thenAnswer((_) async => ResponseGenerics(
        statusCode: 404,
        data: {},
      ));

      final result = await dataSourceUsers.dataSourceGetUsers(1, {});

      // Verifica se o retorno falhou
      expect(result.error, ErrorEnum.error);
    });
  });
}

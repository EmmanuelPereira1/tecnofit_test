import 'package:tecnofit_test/core/core.dart';

abstract class AbstractDataSourceUsers {
  Future<StateGenerics<Map<String, dynamic>, ErrorEnum>> dataSourceGetUsers(int id, Map<String, dynamic> body);
}

class DataSourceUsers implements AbstractDataSourceUsers {
final _remoteClient = AppGetIt.instance.get<AbstractRemoteClient>();

  @override
  Future<StateGenerics<Map<String, dynamic>, ErrorEnum>> dataSourceGetUsers(int id, Map<String,dynamic> body) async {
    final response = await _remoteClient.get(
      "${ApiConnects.users}$id",
      body
    );
    if (response.statusCode != 200) {
      return StateGenerics.failed(error: ErrorEnum.error);
    }
    return StateGenerics.success(data: response.data);
  }
}
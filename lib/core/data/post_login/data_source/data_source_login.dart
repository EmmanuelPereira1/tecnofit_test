import 'package:tecnofit_test/core/core.dart';

abstract class AbstractDataSourceLogin {
  Future<StateGenerics<Map<String, dynamic>, ErrorEnum>> dataSourceLogin(Map<String, dynamic> body);
}

class DataSourceLogin implements AbstractDataSourceLogin {
  final _remoteClient = AppGetIt.instance.get<AbstractRemoteClient>();

  @override
  Future<StateGenerics<Map<String, dynamic>, ErrorEnum>> dataSourceLogin(Map<String, dynamic> body) async {
    final response = await _remoteClient.post(
      url: ApiConnects.login,
      body: body,
    );
    if (response.statusCode != 200) {
      return StateGenerics.failed(error: ErrorEnum.error);
    }
    return StateGenerics.success(data: response.data);
  }
}
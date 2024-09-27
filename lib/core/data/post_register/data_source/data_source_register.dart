import 'package:tecnofit_test/core/core.dart';

abstract class AbstractDataSourceRegister {
  Future<StateGenerics<Map<String, dynamic>, ErrorEnum>> dataSourceRegister(Map<String, dynamic> body);
}

class DataSourceRegister implements AbstractDataSourceRegister {
  final _remoteClient = AppGetIt.instance.get<AbstractRemoteClient>();

  @override
  Future<StateGenerics<Map<String, dynamic>, ErrorEnum>> dataSourceRegister(Map<String, dynamic> body) async {
    final response = await _remoteClient.post(
      url: ApiConnects.register,
      body: body,
    );
    if (response.statusCode != 200) {
      return StateGenerics.failed(error: ErrorEnum.error);
    }
    return StateGenerics.success(data: response.data);
  }
}
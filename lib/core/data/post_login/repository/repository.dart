import 'package:tecnofit_test/core/core.dart';

abstract class AbstractRepositoryLogin {
  Future<StateGenerics<EntityLogin?, ErrorEnum>> repositoryUsers(String email, String password);
} 

class RepositoryLogin implements AbstractRepositoryLogin {
  final _dataSourceLogin = AppGetIt.instance.get<AbstractDataSourceLogin>();

  @override
  Future<StateGenerics<EntityLogin?, ErrorEnum>> repositoryUsers(String email, String password) async {
    try {
      final resource = await _dataSourceLogin.dataSourceLogin({
        "email": email,
        "password": password,
      });
      return StateGenerics.success(data: EntityLogin.fromJson(resource.data!));
    } catch (_) {
      return StateGenerics.failed(error: ErrorEnum.error);
    }
  }
}
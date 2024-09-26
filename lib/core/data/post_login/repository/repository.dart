import 'package:tecnofit_test/core/core.dart';
import 'package:tecnofit_test/core/data/post_login/data_source/data_source_login.dart';
import 'package:tecnofit_test/core/entities/entity_login.dart';

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
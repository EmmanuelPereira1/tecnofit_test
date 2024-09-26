import 'package:tecnofit_test/core/core.dart';

abstract class AbstractRepositoryUsers {
  Future<StateGenerics<Entity?, ErrorEnum>> repositoryUsers();
}

class RepositoryUsers implements AbstractRepositoryUsers {
final _dataSourceUsers = AppGetIt.instance.get<AbstractDataSourceUsers>();

  @override
  Future<StateGenerics<Entity?, ErrorEnum>> repositoryUsers() async {
    try {
      final resource = await _dataSourceUsers.dataSourceUsers();
      return StateGenerics.success(data: Entity.fromMap(resource.data!));
    } catch (_) {
      return StateGenerics.failed(error: ErrorEnum.error);
    }
  }
}
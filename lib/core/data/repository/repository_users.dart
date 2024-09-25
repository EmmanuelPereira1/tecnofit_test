import 'package:tecnofit_test/core/core.dart';

abstract class AbstractRepositoryUsers {
  Future<StateGenerics<Entity?, ErrorEnum>> repositoryUsers(int numberPage);
}

class RepositoryUsers implements AbstractRepositoryUsers {
final _dataSourceUsers = AppGetIt.instance.get<AbstractDataSourceUsers>();

  @override
  Future<StateGenerics<Entity?, ErrorEnum>> repositoryUsers(int numberPage) async {
    try {
      final resource = await _dataSourceUsers.dataSourceUsers(numberPage);
      if (resource.hasError) {
        return StateGenerics.failed(error: ErrorEnum.error);
      }
      return StateGenerics.success(data: Entity.fromJson(resource.data!));
    } catch (_) {
      return StateGenerics.failed(error: ErrorEnum.error);
    }
  }
}
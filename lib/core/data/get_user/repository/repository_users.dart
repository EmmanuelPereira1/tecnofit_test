import 'package:tecnofit_test/core/core.dart';

abstract class AbstractRepositoryUsers {
  Future<StateGenerics<UserEntity?, ErrorEnum>> repositoryUsers(int id,);
}

class RepositoryUsers implements AbstractRepositoryUsers {
final _dataSourceUsers = AppGetIt.instance.get<AbstractDataSourceUsers>();

  @override
  Future<StateGenerics<UserEntity?, ErrorEnum>> repositoryUsers(int id) async {
    try {
      final resource = await _dataSourceUsers.dataSourceGetUsers(id,
        {}
      );
      return StateGenerics.success(data: UserEntity.fromJson(resource.data!));
    } catch (_) {
      return StateGenerics.failed(error: ErrorEnum.error);
    }
  }
}
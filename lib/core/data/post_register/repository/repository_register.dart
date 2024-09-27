import 'package:tecnofit_test/core/core.dart';

abstract class AbstractRepositoryRegister {
  Future<StateGenerics<EntityRegister?, ErrorEnum>> repositoryRegister(String email, String password);
} 

class RepositoryRegister implements AbstractRepositoryRegister {
  final _dataSourceRegister = AppGetIt.instance.get<AbstractDataSourceRegister>();

  @override
  Future<StateGenerics<EntityRegister?, ErrorEnum>> repositoryRegister(String email, String password) async {
    try {
      final resource = await _dataSourceRegister.dataSourceRegister({
        "email": email,
        "password": password,
      });
      return StateGenerics.success(data: EntityRegister.fromJson(resource.data!));
    } catch (_) {
      return StateGenerics.failed(error: ErrorEnum.error);
    }
  }
}
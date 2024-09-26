import 'package:tecnofit_test/core/core.dart';

abstract class AbstractFetchUseCaseUsers {
  Future<StateGenerics<Entity?, ErrorEnum>>
      fetchUseCaseUsers();
}

class FetchUseCaseUsers
    implements AbstractFetchUseCaseUsers {
  @override
  Future<StateGenerics<Entity?, ErrorEnum>>
      fetchUseCaseUsers() async {
    final respository = AppGetIt.instance.get<AbstractRepositoryUsers>();
    final result = await respository.repositoryUsers();

    if(result.hasError || result.data == null) {
      return StateGenerics.failed(error: ErrorEnum.error);
    } 
      return StateGenerics.success(data: result.data!);
  }
}

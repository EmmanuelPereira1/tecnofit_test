import 'package:tecnofit_test/core/core.dart';

abstract class AbstractFetchUseCaseUsers {
  Future<StateGenerics<UserEntity?, ErrorEnum>>
      fetchUseCaseUsers(int id);
}

class FetchUseCaseUsers
    implements AbstractFetchUseCaseUsers {
  @override
  Future<StateGenerics<UserEntity?, ErrorEnum>>
      fetchUseCaseUsers(int id) async {
    final respository = AppGetIt.instance.get<AbstractRepositoryUsers>();
    final result = await respository.repositoryUsers(id);

    if(result.hasError || result.data == null) {
      return StateGenerics.failed(error: ErrorEnum.error);
    } 
      return StateGenerics.success(data: result.data!);
  }
}

import 'package:tecnofit_test/core/core.dart';

abstract class AbstractFetchUseCaseUsers {
  Future<StateGenerics<Entity?, ErrorEnum>>
      fetchUseCaseUsers(int numberPage);
}

class FetchUseCaseUsers
    implements AbstractFetchUseCaseUsers {
  @override
  Future<StateGenerics<Entity?, ErrorEnum>>
      fetchUseCaseUsers(int numberPage) async {
    final respository = AppGetIt.instance.get<AbstractRepositoryUsers>();
    final result = await respository.repositoryUsers(numberPage);

    if(result.hasError || result.data == null || result.data!.empty!) {
      return StateGenerics.failed(error: ErrorEnum.error);
    } else {
      return StateGenerics.success(data: result.data!);
    }
  }
}

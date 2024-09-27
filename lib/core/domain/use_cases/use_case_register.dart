import 'package:tecnofit_test/core/core.dart';


abstract class AbstractFetchUseCaseRegister {
  Future<StateGenerics<EntityRegister?, ErrorEnum>>
      fetchUseCaseRegister(String email, String password);
}

class FetchUseCaseRegister
    implements AbstractFetchUseCaseRegister {
  @override
  Future<StateGenerics<EntityRegister?, ErrorEnum>>
      fetchUseCaseRegister( String email, String password) async {
    final respository = AppGetIt.instance.get<AbstractRepositoryRegister>();
    final result = await respository.repositoryRegister(email, password);

    if(result.hasError || result.data == null) {
      return StateGenerics.failed(error: ErrorEnum.error);
    } 
      return StateGenerics.success(data: result.data!);
  }
}

import 'package:tecnofit_test/core/core.dart';
import 'package:tecnofit_test/core/data/post_login/repository/repository.dart';
import 'package:tecnofit_test/core/entities/entity_login.dart';

abstract class AbstractFetchUseCaseLogin {
  Future<StateGenerics<EntityLogin?, ErrorEnum>>
      fetchUseCaseLogin(String email, String password);
}

class FetchUseCaseLogin
    implements AbstractFetchUseCaseLogin {
  @override
  Future<StateGenerics<EntityLogin?, ErrorEnum>>
      fetchUseCaseLogin( String email, String password) async {
    final respository = AppGetIt.instance.get<AbstractRepositoryLogin>();
    final result = await respository.repositoryUsers(email, password);

    if(result.hasError || result.data == null) {
      return StateGenerics.failed(error: ErrorEnum.error);
    } 
      return StateGenerics.success(data: result.data!);
  }
}

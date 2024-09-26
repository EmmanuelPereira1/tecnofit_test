
import 'package:tecnofit_test/core/core.dart';
import 'package:tecnofit_test/core/data/post_login/data_source/data_source_login.dart';
import 'package:tecnofit_test/core/data/post_login/repository/repository.dart';
import 'package:tecnofit_test/core/data/post_register/data_source/data_source_register.dart';
import 'package:tecnofit_test/core/data/post_register/repository/repository_register.dart';
import 'package:tecnofit_test/core/domain/use_cases/use_case_login.dart';
import 'package:tecnofit_test/core/domain/use_cases/use_case_register.dart';
import 'package:tecnofit_test/mobile/features/home/view/pages/home/bloc/bloc_cubit.dart';

class AppGetIt {

static GetIt instance = GetIt.instance;

Future<void> setupProviders() async {
  //client
  instance.registerLazySingleton<AbstractRemoteClient>(() => RemoteClient());
  //dataSource
  instance.registerLazySingleton<AbstractDataSourceUsers>(() => DataSourceUsers());
  instance.registerLazySingleton<AbstractDataSourceLogin>(() => DataSourceLogin());
  instance.registerLazySingleton<AbstractDataSourceRegister>(() => DataSourceRegister());

  //repository
  instance.registerLazySingleton<AbstractRepositoryUsers>(() => RepositoryUsers());
  instance.registerLazySingleton<AbstractRepositoryLogin>(() => RepositoryLogin());
  instance.registerLazySingleton<AbstractRepositoryRegister>(() => RepositoryRegister());

  //use cases
  instance.registerLazySingleton<AbstractFetchUseCaseUsers>(() => FetchUseCaseUsers());
  instance.registerLazySingleton<AbstractFetchUseCaseLogin>(() => FetchUseCaseLogin());
  instance.registerLazySingleton<AbstractFetchUseCaseRegister>(() => FetchUseCaseRegister());

  //bloc
  instance.registerLazySingleton<BlocCubitLogin>(() => BlocCubitLogin());
  instance.registerLazySingleton<BlocCubitUser>(() => BlocCubitUser());
}
}
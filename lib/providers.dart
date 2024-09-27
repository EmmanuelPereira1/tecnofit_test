
import 'package:tecnofit_test/core/core.dart';

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
}
}
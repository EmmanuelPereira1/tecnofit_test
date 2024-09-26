
import 'package:tecnofit_test/core/core.dart';

class AppGetIt {

static GetIt instance = GetIt.instance;

Future<void> setupProviders() async {
  //client
  instance.registerLazySingleton<AbstractRemoteClient>(() => RemoteClient());
  //dataSource
  instance.registerLazySingleton<AbstractDataSourceUsers>(() => DataSourceUsers());
  //repository
  instance.registerLazySingleton<AbstractRepositoryUsers>(() => RepositoryUsers());
  //use cases
  instance.registerLazySingleton<AbstractFetchUseCaseUsers>(() => FetchUseCaseUsers());
  //bloc
  instance.registerLazySingleton<BlocCubit>(() => BlocCubit());
}
}
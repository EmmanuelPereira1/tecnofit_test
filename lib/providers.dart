
import 'package:tecnofit_test/core/core.dart';

class AppGetIt {

static GetIt instance = GetIt.instance;

Future<void> setupProviders() async {
  instance.registerLazySingleton<AbstractRemoteClient>(() => RemoteClient());
  instance.registerLazySingleton<AbstractDataSourceUsers>(() => DataSourceUsers());
  instance.registerLazySingleton<AbstractRepositoryUsers>(() => RepositoryUsers());
  instance.registerLazySingleton<AbstractFetchUseCaseUsers>(() => FetchUseCaseUsers());
  instance.registerLazySingleton<BlocCubit>(() => BlocCubit());
}
}
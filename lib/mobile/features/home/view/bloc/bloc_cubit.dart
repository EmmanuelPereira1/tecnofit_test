import 'package:tecnofit_test/core/core.dart';

part 'bloc_state.dart';

class BlocCubit extends Cubit<BlocState> {
  final _fetchUserUsecase =
      AppGetIt.instance.get<AbstractFetchUseCaseUsers>();

  Entity? entity;
  String? numberPage;

  void numberPageGet(String newVal) => numberPage = newVal;

  BlocCubit() : super(BlocStateInitial());

  Future<void> fetchUsers(int numberPage) async {
    final result = await _fetchUserUsecase.fetchUseCaseUsers();
    if (result.hasError || result.data == null) {
      emit(BlocError());
    } else {
      emit(BlocSuccess(
       entity: result.data!,
      ));
    }
  }

}


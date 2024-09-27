import 'package:tecnofit_test/core/core.dart';


part 'bloc_state.dart';

class BlocCubitLogin extends Cubit<BlocState> {
  final _fetchLoginUsecase =
      AppGetIt.instance.get<AbstractFetchUseCaseLogin>();
  final _fetchRegisterUsecase =
      AppGetIt.instance.get<AbstractFetchUseCaseRegister>();
  final _fetchUserUsecase =
      AppGetIt.instance.get<AbstractFetchUseCaseUsers>();

  EntityLogin? entity;
  String email = '';
  String password = '';
  

  void setEmail(newValue) => email = newValue;
  void setPassword(newValue) => password = newValue;


  BlocCubitLogin() : super(BlocStateInitial());

  void logoutController() {
    emit(BlocStateInitial());
  }


Future<void> loginController(String email, String password) async {
    // Emite um estado de carregamento (loading) se aplicável
    emit(BlocLoading());

    // Chama o caso de uso para tentar fazer login com email e senha
    final result = await _fetchLoginUsecase.fetchUseCaseLogin(email, password);
    
    // Verifica se houve erro ou se o resultado de login é nulo
    if (result.hasError || result.data == null) {
      emit(const BlocError());
      return;
    }

    // Se o login for bem-sucedido, emite o estado de sucesso com os dados retornados
    emit(BlocSuccess(entityLogin: result.data!));
  }

Future<void> registerController(String email, String password) async {
  // Emite um estado de carregamento (loading) enquanto espera pela resposta
  emit(BlocLoading());

  // Chama o caso de uso para tentar registrar o usuário com email e senha
  final result = await _fetchRegisterUsecase.fetchUseCaseRegister(email, password);

  // Verifica se houve erro ou se o resultado de registro é nulo
  if (result.hasError || result.data == null) {
    emit(const BlocError());
    return;
  }

  // Extrai o ID retornado do registro
  final int userId = result.data!.id!;

  // Armazena o ID para uso posterior (por exemplo, para buscar mais informações do usuário)
  emit(BlocSuccess(entityRegister: result.data!));

  // Usa o ID recebido para buscar mais informações do usuário
  await fetchUserInformations(userId);
}


  Future<void> fetchUserInformations(int id) async {
    final result = await _fetchUserUsecase.fetchUseCaseUsers(id);
    if (result.hasError || result.data == null) {
      emit(const BlocError());
    } else {
      emit(BlocSuccess(
       entityUser: result.data!,
      ));
    }
  }
}


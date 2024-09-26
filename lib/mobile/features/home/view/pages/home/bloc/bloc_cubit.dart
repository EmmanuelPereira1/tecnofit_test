import 'package:tecnofit_test/core/core.dart';
import 'package:tecnofit_test/core/domain/use_cases/use_case_login.dart';
import 'package:tecnofit_test/core/domain/use_cases/use_case_register.dart';
import 'package:tecnofit_test/core/entities/entity_login.dart';
import 'package:tecnofit_test/core/entities/entity_register.dart';

part 'bloc_state.dart';

class BlocCubitUser extends Cubit<BlocStateUser> {
  final _fetchLoginUsecase =
      AppGetIt.instance.get<AbstractFetchUseCaseLogin>();
  final _fetchRegisterUsecase =
      AppGetIt.instance.get<AbstractFetchUseCaseRegister>();
  

  EntityLogin? entity;
  String email = '';
  String password = '';

  void setEmail(newValue) => email = newValue;
  void setPassword(newValue) => password = newValue;


  BlocCubitUser() : super(BlocStateInitialUser());

Future<void> loginController(String email, String password) async {
    // Emite um estado de carregamento (loading) se aplicável
    emit(BlocLoadingUser());

    // Chama o caso de uso para tentar fazer login com email e senha
    final result = await _fetchLoginUsecase.fetchUseCaseLogin(email, password);
    
    // Verifica se houve erro ou se o resultado de login é nulo
    if (result.hasError || result.data == null) {
      emit(const BlocErrorUser());
      return;
    }

    // Se o login for bem-sucedido, emite o estado de sucesso com os dados retornados
    emit(BlocSuccessUser(entityLogin: result.data!));
  }

Future<void> registerController(String email, String password, int? id) async {
    // Emite um estado de carregamento (loading) se aplicável
    emit(BlocLoadingUser());

    // Chama o caso de uso para tentar fazer login com email e senha
    final result = await _fetchRegisterUsecase.fetchUseCaseRegister(email, password);
    
    // Verifica se houve erro ou se o resultado de login é nulo
    if (result.hasError || result.data == null) {
      emit(const BlocErrorUser());
      return;
    }

    // Se o login for bem-sucedido, emite o estado de sucesso com os dados retornados
    emit(BlocSuccessUser(entityRegister: result.data!));
  }

  
}


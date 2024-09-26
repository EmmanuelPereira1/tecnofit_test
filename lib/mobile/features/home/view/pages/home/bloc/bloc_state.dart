part of 'bloc_cubit.dart';

sealed class BlocStateUser extends Equatable {
  const BlocStateUser();

  @override
  List<Object?> get props => [];
}

class BlocStateInitialUser extends BlocStateUser {}

class BlocLoadingUser extends BlocStateUser {}

class BlocErrorUser extends BlocStateUser {
  final String message;

  // O erro pode ter uma mensagem detalhada, para tornar o estado de erro mais informativo.
  const BlocErrorUser({this.message = "Ocorreu um erro"});

  @override
  List<Object?> get props => [message];
}

class BlocSuccessUser extends BlocStateUser {
  final EntityLogin? entityLogin;
  final EntityRegister? entityRegister;

  const BlocSuccessUser({this.entityLogin, this.entityRegister});

  // Método copyWith para copiar o estado atual e opcionalmente modificar propriedades.
  BlocSuccessUser copyWith({
    EntityLogin? entityLogin,
    EntityRegister? entityRegister,
  }) {
    return BlocSuccessUser(
      entityLogin: entityLogin ?? this.entityLogin,
      entityRegister: entityRegister ?? this.entityRegister,
    );
  }

  @override
  List<Object?> get props => [
    entityLogin,
    entityRegister
  ];
}
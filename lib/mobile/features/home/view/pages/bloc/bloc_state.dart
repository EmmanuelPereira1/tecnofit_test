part of 'bloc_cubit.dart';

sealed class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object?> get props => [];
}

class BlocStateInitial extends BlocState {}

class BlocLoading extends BlocState {}

class BlocError extends BlocState {
  final String message;

  // O erro pode ter uma mensagem detalhada, para tornar o estado de erro mais informativo.
  const BlocError({this.message = "Ocorreu um erro"});

  @override
  List<Object?> get props => [message];
}

class BlocSuccess extends BlocState {
  final EntityLogin? entityLogin;
  final EntityRegister? entityRegister;
  final UserEntity? entityUser;


  const BlocSuccess({this.entityUser,this.entityLogin, this.entityRegister});

  BlocSuccess copyWith({
    EntityLogin? entityLogin,
    EntityRegister? entityRegister,
    UserEntity? entityUser,
  }) {
    return BlocSuccess(
      entityLogin: entityLogin ?? this.entityLogin,
      entityRegister: entityRegister ?? this.entityRegister,
      entityUser: entityUser ?? this.entityUser,
    );
  }

  @override
  List<Object?> get props => [
    entityLogin,
    entityRegister,
    entityUser
  ];
}
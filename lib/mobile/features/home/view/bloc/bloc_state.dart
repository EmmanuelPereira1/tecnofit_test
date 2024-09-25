part of 'bloc_cubit.dart';

sealed class BlocState extends Equatable {
 const BlocState();

  @override
  List<Object?> get props => [];
}
 class BlocStateInitial extends BlocState {}

 class BlocLoading extends BlocState {}

 class BlocError extends BlocState {}

class BlocSuccess extends BlocState {
  final Entity? entity;
  final String? tireId;
  

  const BlocSuccess({this.entity, this.tireId});

  BlocSuccess copyWith({
    final String? tireId,
    final Entity? entity,
  }) {
    return BlocSuccess(
      entity: entity ?? this.entity,
      tireId: tireId ?? this.tireId,
    );
  }
  @override
  List<Object?> get props => [
    entity,
    tireId
    ];
}
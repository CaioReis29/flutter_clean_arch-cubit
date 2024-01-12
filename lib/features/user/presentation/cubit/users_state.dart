part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersError extends UsersState {
  final String message;

  const UsersError(this.message);

  @override
  List<Object> get props => [message];
}

class UsersLoaded extends UsersState {
  final List<UserEntity> userEntity;

  const UsersLoaded(this.userEntity);

  @override
  List<Object> get props => [userEntity];
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/features/user/domain/usecases/get_users_usecase.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetUsersUsecase _getUsersUsecase;

  UsersCubit(this._getUsersUsecase) : super(UsersInitial());

  void getUsers() async {
    emit(UsersLoading());
    final failureOrSucess = await _getUsersUsecase();

    emit(
      failureOrSucess.fold(
        (failure) => UsersError(failure.toString()),
        (userModel) => UsersLoaded(userModel),
      ),
    );
  }
}

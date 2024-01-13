import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';
import 'package:flutter_clean_architecture/core/usecases/usecase.dart';
import 'package:flutter_clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/features/user/domain/repositories/user_repository.dart';

class GetUsersUsecase implements UseCaseNoParams<List<UserEntity>> {
  GetUsersUsecase(this.repository);

  final UserRepository repository;

  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    return await repository.getUsers();
  }
}

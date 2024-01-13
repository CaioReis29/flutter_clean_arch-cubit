import 'package:dartz/dartz.dart';
import 'package:flutter_clean_architecture/core/error/exception.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';
import 'package:flutter_clean_architecture/features/user/data/datasources/user/user_datasource.dart';
import 'package:flutter_clean_architecture/features/user/domain/entities/user_entity.dart';
import 'package:flutter_clean_architecture/features/user/domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UsersDatasource _usersDatasource;

  UserRepositoryImp(this._usersDatasource);
  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final response = await _usersDatasource.getUsers();
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
